From: Russell King - ARM Linux <linux@armlinux.org.uk>
Subject: Re: [PATCH v2] ARM: Drop fixed 200 Hz timer requirement from Samsung
 platforms
Date: Mon, 21 Nov 2016 09:24:45 +0000
Message-ID: <20161121092445.GA1041@n2100.armlinux.org.uk>
References: <1479453418-25314-1-git-send-email-krzk@kernel.org>
 <22757093.ejshJp9T7L@wuerfel>
 <CA+Ln22GyRwywcxdO4Gp67d8TfpjfNzaE0z25=WW9GWibjGkDuQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from pandora.armlinux.org.uk ([78.32.30.218]:52164 "EHLO
        pandora.armlinux.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752731AbcKUJZO (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Mon, 21 Nov 2016 04:25:14 -0500
Content-Disposition: inline
In-Reply-To: <CA+Ln22GyRwywcxdO4Gp67d8TfpjfNzaE0z25=WW9GWibjGkDuQ@mail.gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Tomasz Figa <tomasz.figa@gmail.com>
Cc: Arnd Bergmann <arnd@arndb.de>, linux-arm-kernel <linux-arm-kernel@lists.infradead.org>, Krzysztof Kozlowski <krzk@kernel.org>, Kukjin Kim <kgene@kernel.org>, Javier Martinez Canillas <javier@osg.samsung.com>, "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>, linux-kernel <linux-kernel@vger.kernel.org>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, Ben Dooks <ben.dooks@codethink.co.uk>, Sylwester Nawrocki <s.nawrocki@samsung.com>, Lee Jones <lee.jones@linaro.org>, Marek Szyprowski <m.szyprowski@samsung.com>

On Mon, Nov 21, 2016 at 03:01:57PM +0900, Tomasz Figa wrote:
> One thing to correct here is that the typical clock is PCLK, which is
> derived from one of the PLLs and AFAIR is between 33-66 MHz on
> s3c24xx. Technically you can drive the PWM block from an external
> clock (12 MHz for some board-file based boards), but for simplicity
> this functionality was omitted in the new PWM timer driver used for DT
> boards (which worked fine with the PWM driven by PCLK).

So that's a knowingly-made regression for s3c24xx then.  Pretty
disgusting developer behavior to do that, IMHO.

-- 
RMK's Patch system: http://www.armlinux.org.uk/developer/patches/
FTTC broadband for 0.8mile line: currently at 9.6Mbps down 400kbps up
according to speedtest.net.
