# Notification Channels

## 🎯 Goal
Deliver alerts through channels that match urgency and team workflow.

## Channel strategy
Examples include email, webhooks, chat systems, and incident-management platforms. Critical alerts should reach the responders responsible for immediate action.

## Receiver design
A receiver should identify:

- Alert name.
- Severity.
- Service/team.
- Environment.
- Summary.
- Link to dashboard/runbook.

## Templates
Use templates to keep messages consistent and reduce cognitive load during incidents.

## 🧪 Lab
Configure a non-production receiver, trigger a test alert, inspect the message, and improve it until the responder can understand the incident without opening Prometheus first.

## Security
Store credentials outside Git where possible. Rotate tokens and restrict webhook access.

## Troubleshooting
Alertmanager sees alert → route matches → receiver selected → network request succeeds → provider accepts message.

## ✅ Completion
- [ ] Configure one receiver.
- [ ] Test delivery.
- [ ] Include useful context.
- [ ] Protect credentials.