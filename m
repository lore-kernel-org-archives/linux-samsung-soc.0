From: Sylwester Nawrocki <s.nawrocki@samsung.com>
Subject: Re: [PATCH] phy: Add exynos-phy driver
Date: Wed, 11 Dec 2013 11:16:39 +0100
Message-ID: <52A83B87.205@samsung.com>
References: <1385558788-10880-1-git-send-email-t.stanislaws@samsung.com>
 <52A8364B.5020204@ti.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-reply-to: <52A8364B.5020204@ti.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Kishon Vijay Abraham I <kishon@ti.com>, Tomasz Stanislawski <t.stanislaws@samsung.com>, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, devicetree@vger.kernel.org
Cc: t.figa@samsung.com, kgene.kim@samsung.com, grant.likely@linaro.org, rob.herring@calxeda.com, sylvester.nawrocki@gmail.com, kyungmin.park@samsung.com
List-Id: linux-samsung-soc@vger.kernel.org

On 11/12/13 10:54, Kishon Vijay Abraham I wrote:
> On Wednesday 27 November 2013 06:56 PM, Tomasz Stanislawski wrote:
>> > Hello everyone,
>> > The Samsung SoCs from Exynos family are enhanced with a bunch of switches
>> > dedicated for IP blocks. Those switches are called PHYs in Exynos
>> > specification. They are usually controlled by a single bit in a single
>> > one-word-long register.
>
> So only enabling this switch is enough for the controller or some other actual
> PHY IP is needed along with this switch?
> 
> However I'm not sure if the switch should be modelled as PHY as it is not a PHY
> in the real sense.

These are ordinary PHY devices embedded in an SoC. I wouldn't really call
them "switches", as they indeed provide the physical layer functionality 
for various interfaces, like USB, HDMI, MIPI CSI/DSI, etc. Their control 
interface is often very simple - usually only an enable and a reset 
control bit. But that can't change the fact they are real PHY devices,
so let's not call them switches, that's just untrue.

Regards,
Sylwester
