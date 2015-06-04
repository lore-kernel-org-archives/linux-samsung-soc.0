From: Javier Martinez Canillas <javier.martinez@collabora.co.uk>
Subject: Re: [PATCH] ARM: multi_v7_defconfig: enable usb3503
Date: Thu, 04 Jun 2015 08:38:24 +0200
Message-ID: <556FF260.5060006@collabora.co.uk>
References: <1426254866-24772-1-git-send-email-riku.voipio@linaro.org> <7hsia846wa.fsf@deeprootsystems.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from bhuna.collabora.co.uk ([93.93.135.160]:43288 "EHLO
	bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750868AbbFDGib (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 4 Jun 2015 02:38:31 -0400
In-Reply-To: <7hsia846wa.fsf@deeprootsystems.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Kevin Hilman <khilman@kernel.org>, riku.voipio@linaro.org
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, tyler.baker@linaro.org

Hello Kevin,

On 06/04/2015 03:08 AM, Kevin Hilman wrote:
> riku.voipio@linaro.org writes:
> 
>> From: Riku Voipio <riku.voipio@linaro.org>
>>
>> CONFIG_USB_HSIC_USB3503 is needed by exynos5250-arndale for the on-board
>> asix network controller. Enable it so networking works with
>> multi_v7_defconfig out of box like it does with exynos_defconfig.
>>
>> USB3503 is also referenced from exynos4412-odroidu3.dts and
>> exynos5250-spring.dts so this patch should improve
>> multi_v7_defconfig on those platforms as well.
>>
>> Signed-off-by: Riku Voipio <riku.voipio@linaro.org>
> 
> Tyler pointed me to this in order to get arndale networking on mainline,
> but looks like this might need to be revisited for current mainline.  
> 
> I tested this and it doesn't work because as of commit 7de7c6717f2c
> (ARM: multi_v7_defconfig: Enable Exynos USB PHY) the PHY that this
> depends on is built as a module in multi_v7_config, so having this
> driver built-in doesn't help.  Even after the PHY driver is loaded, this
> driver will not detect the hardware.
> 
> So instead, I think this driver should be built as a module as well.
> Testing that, I can get networking by doing loading both the phy and
> this driver after boot:
> 
>  # modprobe phy-exynos-usb2
>  # modprobe usb3503
>

Current policy is to have as much as possible built as a module
in multi_v7_config so regardless of your issue I think that the
patch should be re-spun to change this.

But I wonder why is not working, shouldn't the driver defer and
be probed again once the PHY driver probe succeeds?

> Kevin
> 

Best regards,
Javier
