From: Javier Martinez Canillas <javier.martinez@collabora.co.uk>
Subject: Re: [RFC PATCH 1/4] spi: spidev: Add Google SPI flash compatible
 string
Date: Wed, 20 May 2015 13:21:53 +0200
Message-ID: <555C6E51.5030601@collabora.co.uk>
References: <1432042454-19234-1-git-send-email-javier.martinez@collabora.co.uk> <1432042454-19234-2-git-send-email-javier.martinez@collabora.co.uk> <20150520101318.GB21577@sirena.org.uk> <555C5F65.7010204@collabora.co.uk> <20150520103746.GD21577@sirena.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20150520103746.GD21577@sirena.org.uk>
Sender: linux-kernel-owner@vger.kernel.org
To: Mark Brown <broonie@kernel.org>
Cc: Kukjin Kim <kgene@kernel.org>, Krzysztof Kozlowski <k.kozlowski@samsung.com>, Olof Johansson <olof@lixom.net>, Doug Anderson <dianders@chromium.org>, David Hendricks <dhendrix@google.com>, linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org

Hello Mark,

On 05/20/2015 12:37 PM, Mark Brown wrote:
> On Wed, May 20, 2015 at 12:18:13PM +0200, Javier Martinez Canillas wrote:
>> On 05/20/2015 12:13 PM, Mark Brown wrote:
> 
>> > This is adding a binding with no documentation, documentation is
>> > mandatory for all bindings.
> 
>> Yes, I missed... sorry about that. Do you agree with the approach
>> though so I can re-spin the patches adding the missing DT binding?
> 
> It's probably OK but I didn't really drill through since the binding was
> missing.  If these parts are commodity as described it seems surprising
> that they aren't compatible with any existing kernel driver.
> 

The ChromeOS user-space just uses flashrom to send a raw stream of bytes
via spidev to the SPI NOR flash chip. There is drivers/mtd/spi-nor/spi-nor.c
but AFAIU there are some limitations when interfacing the flash through
the MTD layer, for example there isn't a way to set the SPI flash write
protection through MTD. But I'll do some investigation before re-spinning
the patches.

BTW, the other "rohm,dh2228fv" compatible string in spidev added by commit
8fad805bdc52 ("spi: spidev: Add Rohm DH2228FV DAC compatible string"), also
does not have a documented DT binding so that should be fixed as well.

Best regards,
Javier
