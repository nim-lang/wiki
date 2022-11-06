import nimib, nimibook

nbInit(theme = useNimibook)

nbText:"""
## Moderator guidelines

We aim to be an inclusive community and as such you should refrain from kicking and banning users from the #nim IRC channel. If an argument goes out of hand then you may silence the users involved for a length of time that is no longer than 15 minutes. Kicking/Banning should be reserved for the absolute last resort, that is, if the user is intentionally causing chaos in the IRC channel despite many warnings.

**Some useful tips in Ubuntu's guidelines as well: https://wiki.ubuntu.com/IRC/IrcTeam/OperatorGuide**

## How To

The following commands can be executed by sending them via the text box that you ordinarily use to speak with people.

### Ban using ChanServ

**This is recommended when dealing with trolls**

`/msg chanserv akick #nim add *!*@*ip.185.95.206.58 !T 20d`

Replace `ip.185.95.206.58` with the webchat IP, or with whatever the user's hostname is.

This will cause ChanServ to automatically kick and ban any users that match the hostname mask for 20 days.

### Quiet user

First you need to get the ``o`` flag on yourself with ``/msg ChanServ op #nim``.

To mute somebody in the channel use the following command: ``/mode #nim +q <MASK>`` where ``<MASK>`` is how the user that will be muted is determined.

If for example the user's nickname (that you want to mute) is 'NimIsAwesome' then you can use the following mask: ``NimIsAwesome!*@*``.

If you know the account that the user is logged in under (you can check this via /whois). Then you can use ``$a:accountName`` as the mask.

For more info about the masks take a look at the Freenode docs [here](https://freenode.net/using_the_network.shtml).

### Quiet every webchat user

After you get the ``o`` flag (``/msg chanserv op #nim``), just use the following: ``/mode #nim +q *!*@*gateway/web/freenode/ip.*``.

Keep in mind that this will mute all webchat users! It is useful when trolls are connecting via different IPs using the webchat though. You can also set exemptions on certain users who you know are safe: ``/mode #nim +e <username>``.

**If you forgot what mask you banned/muted**: ``/mode q`` or ``/mode b``.

### Quiet every unregistered user

Just ``/mode #nim +q $~a``.

### Get in touch with Freenode staff

Do highlight somebody from Freenode if the infamous troll is attacking our channel.

``/stats p`` to get a list of Freenode staff members

or ask in #freenode for a staff member. We also have ``Fuchs`` idling in our channel to monitor it right now.

### Redirect webchat users to #nim-web

Set a ban on ``*!*@gateway/web/freenode*$#nim-web``.

During a spam attack such as the one that was [occurring on 01-08-2018](https://freenode.net/news/spambot-attack), we just redirected all new users to #nim-web: ``/ban *!*@*$#nim-web``.

### Reduced moderation

The ``+z`` channel mode allows operators to see messages sent by quietened users. See here for reference: https://freenode.net/kb/answer/channelmodes

## Useful links
* https://freenode.net/kb/all"""
nbSave()
