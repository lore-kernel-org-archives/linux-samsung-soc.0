From: Arnd Bergmann <arnd@arndb.de>
Subject: Re: [PATCH 02/10] ASoC: samsung/smartq: use dynamic registration
Date: Tue, 01 Dec 2015 16:11:40 +0100
Message-ID: <1538856.GqqaeJI10z@wuerfel>
References: <1448467615-447097-1-git-send-email-arnd@arndb.de> <1448467615-447097-3-git-send-email-arnd@arndb.de> <565CE8B8.3090903@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <565CE8B8.3090903@samsung.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Krzysztof Kozlowski <k.kozlowski@samsung.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, Kukjin Kim <kgene@kernel.org>, Mark Brown <broonie@kernel.org>, Vasily Khoruzhick <anarsoul@gmail.com>, Charles Keepax <ckeepax@opensource.wolfsonmicro.com>, Tomasz Figa <tfiga@chromium.org>, Ben Dooks <ben.dooks@codethink.co.uk>, linux-samsung-soc@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org

On Tuesday 01 December 2015 09:24:24 Krzysztof Kozlowski wrote:
> > +static struct platform_driver smartq_driver = {
> > +     .driver = {
> > +             .name = "smartq-audio",
> > +             .owner = THIS_MODULE,
> 
> The owner should not be needed (coccicheck should also complain). Rest
> looks good, so:

Good catch, fixed now!
 
> Reviewed-by: Krzysztof Kozlowski <k.kozlowski@samsung.com>

thanks,

	Arnd
