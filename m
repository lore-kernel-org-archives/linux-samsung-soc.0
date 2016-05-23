From: "Steinar H. Gunderson" <sgunderson@bigfoot.com>
Subject: Re: Endless "supply vcc not found, using dummy regulator"
Date: Mon, 23 May 2016 19:46:43 +0200
Message-ID: <20160523174643.GA33973@sesse.net>
References: <20160521144308.GA13960@sesse.net>
 <20160523134737.GA21683@sesse.net>
 <20160523144047.GA36908@sesse.net>
 <20160523162455.GW8206@sirena.org.uk>
 <20160523170617.GA8997@sesse.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from cassarossa.samfundet.no ([193.35.52.29]:44141 "EHLO
	cassarossa.samfundet.no" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752102AbcEWRqt (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 23 May 2016 13:46:49 -0400
Content-Disposition: inline
In-Reply-To: <20160523170617.GA8997@sesse.net>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Mark Brown <broonie@debian.org>
Cc: linux-samsung-soc@vger.kernel.org, 823552@bugs.debian.org

On Mon, May 23, 2016 at 07:06:17PM +0200, Steinar H. Gunderson wrote:
> Then, there's the issue of why the messages come for each deferred probe
> attempt. It seems from your message this is about something in the
> declaration of the device tree; I don't understand the nuances here, but I
> suppose it's pretty easy?

FWIW, from reading drivers/usb/phy/phy-generic.c, it looks like vcc-supply on
the USB phy is supposed to be optional.

/* Steinar */
-- 
Homepage: https://www.sesse.net/
