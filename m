From: "Steinar H. Gunderson" <sgunderson@bigfoot.com>
Subject: Re: Endless "supply vcc not found, using dummy regulator"
Date: Mon, 23 May 2016 19:06:17 +0200
Message-ID: <20160523170617.GA8997@sesse.net>
References: <20160521144308.GA13960@sesse.net>
 <20160523134737.GA21683@sesse.net>
 <20160523144047.GA36908@sesse.net>
 <20160523162455.GW8206@sirena.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from cassarossa.samfundet.no ([193.35.52.29]:44012 "EHLO
	cassarossa.samfundet.no" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752997AbcEWRGV (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 23 May 2016 13:06:21 -0400
Content-Disposition: inline
In-Reply-To: <20160523162455.GW8206@sirena.org.uk>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Mark Brown <broonie@debian.org>
Cc: linux-samsung-soc@vger.kernel.org, 823552@bugs.debian.org

On Mon, May 23, 2016 at 05:24:55PM +0100, Mark Brown wrote:
>>> Cc-ing Mark in case he has any insights (I hope I have the right em=
ail
>>> address).
> But nobody who works on probe deferral or made any of the suggestions=
 I
> mentioned in the message you linked to, nor anyone who works on the
> driver you've identified a bug in...  :(

As for the former, I have no idea who they would be, sorry. For the lat=
ter,
isn't linux-samsung-soc@ the right place? MAINTAINERS said it was.

>> So fixing initramfs-tools to include the driver will seemingly fix (=
or maybe
>> more work around) the huge amounts of spam, but this is still a larg=
er issue
>> that needs resolving.
> Not really, the issue you're seeing is just a plain resource leak in =
the
> driver that happens to blow up worse than normal in your particular
> configuration.  This isn't even something related to probe deferral a=
t
> the regulator level, the core is complaining that your system
> description is buggy as it has omitted some of the supplies for the
> device (notice how it says "using dummy regulator"...).   This is
> happening a lot as the DWC3 driver is leaking, it is happening at all
> because when the Exynos DWC3 integration creates it PHYs it doesn't m=
ap
> the supplies through to them (it should be registering a supply alias=
 to
> do this).

So there are multiple issues in play here. First of all, the leak is ba=
d,
but it doesn't affect the issue with the system not booting. If I set
loglevel=3D0, it boots with or without the leak patch; however, it stil=
l sends
a gazillion error lines to dmesg (with or without the deferral).

Second, there's the issue that the driver takes so long to load in the =
first
place. This is because the regulator isn't up and doesn't come up befor=
e
after initramfs is done. This is a bug in Debian's initramfs-tools, but
hopefully easily remedied.

Then, there's the issue of why the messages come for each deferred prob=
e
attempt. It seems from your message this is about something in the
declaration of the device tree; I don't understand the nuances here, bu=
t I
suppose it's pretty easy?

=46ourth, there's the question of why there are thousands of probe atte=
mpts;
it shouldn't be even if the regulator takes a long time to come up. I g=
uess
this is what your original message was about, and fixing that would als=
o
reduce the amount of logging a ton (plus presumably speed up boot by wa=
sting
less CPU on repeated probing). But as I understand you, it's not strict=
ly
necessary to actually fix this issue?

=46ifth and finally, there's the question of whether we can suppress
diagnostics on a probe that ends up being deferred. It would also solve=
 the
problem here, although perhaps less elegantly than fixing issues #3 or
#4 (or to a lesser degree, #2), either of which will make my system boo=
t. :-)

> The patch you linked to was for a completely different error message
> which is at least related to probe deferral

Yes, it's a different error message, but points to the same issue as #4
above, no?

> though fundamentally unless
> we just stop printing diagnostics (which is getting more and more
> tempting to be honest) I'm not sure anything is going to fully resolv=
e
> leaks like this, the best chance you've got is something that explici=
tly
> looks at the dependencies like Raphael was proposing.

What do you mean by =E2=80=9Cleaks=E2=80=9D here?

/* Steinar */
--=20
Homepage: https://www.sesse.net/
