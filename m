From: Tomasz Stanislawski <t.stanislaws@samsung.com>
Subject: Re: exynos4412: porting hdmiddc and hdmiphy node entries
Date: Mon, 05 May 2014 11:26:10 +0200
Message-ID: <53675932.30306@samsung.com>
References: <535C504A.2090809@gmx.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout1.w1.samsung.com ([210.118.77.11]:61319 "EHLO
	mailout1.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755396AbaEEJ00 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 5 May 2014 05:26:26 -0400
Received: from eucpsbgm1.samsung.com (unknown [203.254.199.244])
 by mailout1.w1.samsung.com
 (Oracle Communications Messaging Server 7u4-24.01(7.0.4.24.0) 64bit (built Nov
 17 2011)) with ESMTP id <0N53002HLGVYKB50@mailout1.w1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Mon, 05 May 2014 10:26:22 +0100 (BST)
In-reply-to: <535C504A.2090809@gmx.net>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Tobias Jakobi <liquid.acid@gmx.net>, linux-samsung-soc@vger.kernel.org

Hi Tobias,
Sorry for a late reply.
Please refer to the comments below.

On 04/27/2014 02:33 AM, Tobias Jakobi wrote:
> Hello,
> 
> I'm trying to get the HDMI port working on a Exynos4412 based board.
> Attached is a snippet of a dts. This config was supposed to "work" in
> the past.
> 
> However with 3.15-rc1 some things changed. samsung,exynos4210-hdmiddc
> and samsung,exynos4212-hdmiphy have no function anymore, the code that
> previously handled these compatible strings is gone.
> 
> So, it looks like that without some patching, HDMI support is atm broken.
> 
> I have applied these:
> http://www.spinics.net/lists/linux-samsung-soc/msg28161.html
> http://www.spinics.net/lists/linux-samsung-soc/msg28259.html
> 
> With the first one I can drop a clock from the hdmi node. But then
> trouble starts.
> 
> So, first of all I'm unsure what the 'hdmiddc' node should be converted
> to. Documentation (exynos_hdmi.txt) doesn't help here, since it just
> says "phandle to the hdmi ddc node". What kind of 'hdmi ddc node'? From
> the code it looks like that it should point to an i2c adapter now. So
> should it point to 'i2c_2' now?

The spec is wrong. It should be a handle to I2C adapter.
The semantics of this node was changed in patch
"drm/exynos: hdmi: use i2c_adapter instead of i2c_client"
8fa04aae2aa8bafcfc027856904ebee0060506d0

> 
> The second thing is 'phy', which should be a "phandle to the hdmi ddc
> node". Again, no idea what that node should be. Apparantly such nodes
> can't be created with current kernel code anyway, primary reason to
> apply the simply-phy patches.

The meaning of hdmiphy is ambiguous.
In exynos4 spec there are _TWO_ components named HDMIPHY.
The first one is a PLL that generates a clock for HDMI subsystem.
This PLL is controlled by I2C.

You can find an example of its bindings at:
http://lists.freedesktop.org/archives/dri-devel/2013-October/047687.html


The second one is HDMI's physical interface located in PMU unit.

The exynos-simple-phy is dedicated to controller the former (component of PMU).

The 'phy' attribute in DT refers to the PLL.
There is a debate if 'phy' should refer to I2C device itself or
rather to I2C bus. Currently it refers to driverless instance
of I2C device.

> 
> OK, so I have to put a simple-phys node in my dts now. Or, wait, do I
> just replace the hdmiphy node with a simple-phys node?
> 
> Would look something like this:
> hdmiphy: simple-phys@38 {
>   compatible = "samsung,exynos4412-simple-phy";
>   reg = <0x38 0x10000>;
>   #phy-cells = <1>;
> };
> 
> Somehow this doesn't look right. And indeed:
> https://patchwork.kernel.org/patch/4021121/
> 
> At least for exynos5250 this node is not a child on an i2c adapter.

This is a completely different HDMIPHY.

> 
> And yes, I would still have to add 'phys' and 'phy-names' to the hdmi
> node. This looks wrong again. Why do I have to specify 'phys' when I
> already have 'phy' there? Isn't that redundant?

'phys' and 'phy-names' refers to PHY interfaces delivered by phy-core.
The attribute named 'phy' refers to I2C device used to controller HDMI's PLL.
The naming convention is very misleading.

> 
> Well, you see, lots of confusion here. I would appreciate any kind of
> help on how to proceed here.

The documentation for HDMI's bindings should be fixed.

> 
> With best wishes,
> Tobias
> 

Regards,
Tomasz Stanislawski
