From: Kukjin Kim <kgene@kernel.org>
Subject: Re: [PATCH] ARM: dts: Add Exynos5250 Snow Rev5+ support
Date: Wed, 30 Sep 2015 15:58:32 +0900
Message-ID: <560B8818.8020002@kernel.org>
References: <1443527855-434-1-git-send-email-javier@osg.samsung.com> <560B2D29.5060707@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail.kernel.org ([198.145.29.136]:51803 "EHLO mail.kernel.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1753711AbbI3G6n (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 30 Sep 2015 02:58:43 -0400
In-Reply-To: <560B2D29.5060707@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Krzysztof Kozlowski <k.kozlowski@samsung.com>
Cc: Javier Martinez Canillas <javier@osg.samsung.com>, linux-kernel@vger.kernel.org, Mauro Carvalho Chehab <mchehab@osg.samsung.com>, Doug Anderson <dianders@chromium.org>, Olof Johansson <olof@lixom.net>, Russell King <linux@arm.linux.org.uk>, Kukjin Kim <kgene@kernel.org>, devicetree@vger.kernel.org, Kumar Gala <galak@codeaurora.org>, Ian Campbell <ijc+devicetree@hellion.org.uk>, linux-samsung-soc@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, linux-arm-kernel@lists.infradead.org

On 09/30/15 09:30, Krzysztof Kozlowski wrote:
> On 29.09.2015 20:57, Javier Martinez Canillas wrote:
>> There are 2 revisions of the Exynos5250 Snow Chromebook that were shipped:
>> Rev4 and Rev5. The only difference between these 2 revisions is the codec,
>> Rev4 has a max98095 codec while Rev5 has a max98090.
>>
>> Mainline only supports Rev4 so this patch moves the common device nodes to
>> a DTSI file and adds a DTS for the Exynos5250 Snow Rev5.
>>
>> The Snow Rev5 DTS is based on the DTS found in the ChromiumOS 3.8 tree.
>>
>> Signed-off-by: Javier Martinez Canillas <javier@osg.samsung.com>
>>
>> ---
>>
>> The DTS in the vendor ChromeOS tree are called exynos5250-snow-rev{4,5}.dtb
>> but I decided to leave Rev4 as exynos5250-snow.dtb to avoid breaking u-boot
>> that has CONFIG_DEFAULT_DEVICE_TREE="exynos5250-snow" in snow_defconfig.
>>
>> Also, ChromiumOS Rev4 DTS has "google,snow-rev4" in its compatible string
>> but was not added in mainline since Rev4 firmware fallbacks to "google,snow"
>> and Rev5 searches for "google,snow-rev5". That way the compatible string
>> could be consistent with the DTS naming and still be able to pack both Rev4
>> and Rev5 FDT in the same FIT image and let the firmware pick the correct FDT.
>>
>>  arch/arm/boot/dts/Makefile                    |   1 +
>>  arch/arm/boot/dts/exynos5250-snow-common.dtsi | 684 ++++++++++++++++++++++++++
>>  arch/arm/boot/dts/exynos5250-snow-rev5.dts    |  47 ++
>>  arch/arm/boot/dts/exynos5250-snow.dts         | 666 +------------------------
>>  4 files changed, 733 insertions(+), 665 deletions(-)
>>  create mode 100644 arch/arm/boot/dts/exynos5250-snow-common.dtsi
>>  create mode 100644 arch/arm/boot/dts/exynos5250-snow-rev5.dts
> 
> Now the exynos5250-snow.dts means in fact Rev4... but there is no
> information in DTS about it. I think adding compatible
> "google,snow-rev4" makes sense:
> 1. For informational purposes (this could be also handled with a comment).
> 2. Later one could decide to switch the default meaning of "google,snow"
> to Rev5 and the real compatible (rev4) will be there already.
> 
> Could you add the new compatible and fix patch issues pointed by Doug?
> 
Documenting for the compatibles would be required even I already applied
its updated patch...

- Kukjin
