From: Joe Perches <joe@perches.com>
Subject: Re: [PATCH] rtc: s3c: Don't print an error on probe deferral
Date: Mon, 14 Mar 2016 13:03:11 -0700
Message-ID: <1457985791.11972.128.camel@perches.com>
References: <1457982308-29848-1-git-send-email-javier@osg.samsung.com>
	 <1457982675.11972.119.camel@perches.com> <56E7119B.9060900@osg.samsung.com>
	 <1457984317.11972.123.camel@perches.com> <56E71825.5070104@osg.samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from smtprelay0124.hostedemail.com ([216.40.44.124]:45130 "EHLO
	smtprelay.hostedemail.com" rhost-flags-OK-OK-OK-FAIL)
	by vger.kernel.org with ESMTP id S932101AbcCNUDP (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 14 Mar 2016 16:03:15 -0400
In-Reply-To: <56E71825.5070104@osg.samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Javier Martinez Canillas <javier@osg.samsung.com>, linux-kernel@vger.kernel.org
Cc: Alexandre Belloni <alexandre.belloni@free-electrons.com>, linux-samsung-soc@vger.kernel.org, Krzysztof Kozlowski <k.kozlowski@samsung.com>, rtc-linux@googlegroups.com

On Mon, 2016-03-14 at 16:59 -0300, Javier Martinez Canillas wrote:
> I don't think they make little sense now since even a non-native engl=
ish
> speaker like me can understand it :)

That's a non sequitur if ever I read one.

> But yes, it's cryptic at the very least. That's the problem with long=
 text
> and the 80 char limit to make checkpatch.pl happy. I guess I can just=
 move
> the message a little bit even if that will make to not be properly al=
igned.

There's no issue with longer than 80 column lines
for these messages. =A0checkpatch wouldn't complain.
