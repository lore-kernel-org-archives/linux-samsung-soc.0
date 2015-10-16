From: Javier Martinez Canillas <javier@osg.samsung.com>
Subject: Re: [PATCH v2 0/6] ARM: dts: Use correct CD properties for SDIO and
 eMMC in Snow and Peach
Date: Fri, 16 Oct 2015 15:48:30 +0200
Message-ID: <5621002E.4080906@osg.samsung.com>
References: <1444927873-15140-1-git-send-email-javier@osg.samsung.com>
 <5620E17B.9080906@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from lists.s-osg.org ([54.187.51.154]:32988 "EHLO lists.s-osg.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S932270AbbJPNsg (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 16 Oct 2015 09:48:36 -0400
In-Reply-To: <5620E17B.9080906@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Alim Akhtar <alim.akhtar@samsung.com>, linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <k.kozlowski@samsung.com>, Kukjin Kim <kgene@kernel.org>, Douglas Anderson <dianders@chromium.org>, Tomeu Vizoso <tomeu.vizoso@collabora.com>, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org

Hello Alim,

On 10/16/2015 01:37 PM, Alim Akhtar wrote:
> Hi Javier,
> 
> On 10/15/2015 10:21 PM, Javier Martinez Canillas wrote:
>> Hello,
>>
>> The Exynos Chromebooks DTS don't use the correct card detection properties
>> since these were carried from the vendor tree that had a reason to do so.
>>
>> There are two things that I noticed:
>>
>> 1) The Marvell WiFi SDIO is marked as broken-cd instead of non-removable:
>>
>> This causes the device to be removed when the system enters into a suspend
>> state which leads to the following warning when the system is resumed:
>>
>> [  181.944636] mmc2: error -2 during resume (card was removed?)
>>
>> The rationale for using broken-cd is explained in downstream commit [0] and
>> was that using the non-removable property caused issues with the mwifiex
>> driver since the reset logic called the mmc_{remove,add}_host() functions.
>>
>> But the reset logic in the mwifiex mainline driver has changed and this is
>> no longer the case so it's safe to use the non-removable property AFAICT.
>>
> Good to know it is fixed now. This is fixed in firmware or in the driver?
>

The fix is only in the driver. In fact, I'm using the same firmware from
the ChromeOS rootfs for both the v3.8 vendor tree and mainline.

So IIUC, the problem with the vendor tree was that the mwifiex SDIO driver
mwifiex_sdio_reset_work() function did a card reset by calling the functions
mmc_remove_host() and then mmc_add_host().

But this didn't play nice with MMC_CAP_NONREMOVABLE since mmc_rescan() just
returns if the flag is set so the card wouldn't be tried to be detected again.

After commit ("b4336a282db8 mwifiex: sdio: reset adapter using mmc_hw_reset"),
the card is reset by doing a power cycle so that's why "non-removable" can be
used now instead of "broken-cd".

>> 2) The eMMC node has both broken-cd and non-removable but the MMC DT binding
>> doc (Documentation/devicetree/bindings/mmc/mmc.txt) mentions that only one
>> of these card detection properties should be used.
>>
> This change looks ok, will take a closer look once I am back to my work station.
>

Thanks a lot for taking a look.

Best regards,
-- 
Javier Martinez Canillas
Open Source Group
Samsung Research America
