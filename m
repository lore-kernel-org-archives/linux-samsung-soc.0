From: "Steinar H. Gunderson" <sgunderson@bigfoot.com>
Subject: Re: Endless "supply vcc not found, using dummy regulator"
Date: Mon, 23 May 2016 16:40:47 +0200
Message-ID: <20160523144047.GA36908@sesse.net>
References: <20160521144308.GA13960@sesse.net>
 <20160523134737.GA21683@sesse.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from cassarossa.samfundet.no ([193.35.52.29]:39936 "EHLO
	cassarossa.samfundet.no" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753819AbcEWOky (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 23 May 2016 10:40:54 -0400
Content-Disposition: inline
In-Reply-To: <20160523134737.GA21683@sesse.net>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: 823552@bugs.debian.org, broonie@kernel.org

On Mon, May 23, 2016 at 03:47:37PM +0200, Steinar H. Gunderson wrote:
> I don't understand entirely why it tries 2000+ times before it succeeds

Now I do; the initramfs doesn't include i2c-exynos5, and before that is
loaded, s2mps11 (the regulator) can't come up either.

So fixing initramfs-tools to include the driver will seemingly fix (or maybe
more work around) the huge amounts of spam, but this is still a larger issue
that needs resolving.

/* Steinar */
-- 
Homepage: https://www.sesse.net/
