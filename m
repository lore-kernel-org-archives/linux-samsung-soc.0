From: Yakir Yang <ykk@rock-chips.com>
Subject: Re: [PATCH v6 0/17] Add Analogix Core Display Port Driver
Date: Tue, 20 Oct 2015 19:40:32 +0800
Message-ID: <56262830.4030201@rock-chips.com>
References: <1441086371-24838-1-git-send-email-ykk@rock-chips.com> <1444491357-26095-1-git-send-email-ykk@rock-chips.com> <5624C896.8070108@osg.samsung.com> <5625A2A1.6090907@rock-chips.com> <56260E06.2040902@osg.samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <56260E06.2040902@osg.samsung.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Javier Martinez Canillas <javier@osg.samsung.com>, Inki Dae <inki.dae@samsung.com>, Andrzej Hajda <a.hajda@samsung.com>, Joonyoung Shim <jy0922.shim@samsung.com>, Seung-Woo Kim <sw0312.kim@samsung.com>, Kyungmin Park <kyungmin.park@samsung.com>, Jingoo Han <jingoohan1@gmail.com>, Thierry Reding <treding@nvidia.com>, Krzysztof Kozlowski <k.kozlowski@samsung.com>, Rob Herring <robh+dt@kernel.org>, joe@perches.com, Heiko Stuebner <heiko@sntech.de>, Mark Yao <mark.yao@rock-chips.com>
Cc: Russell King <linux@arm.linux.org.uk>, djkurtz@chromium.org, dianders@chromium.org, Sean Paul <seanpaul@chromium.org>, Kukjin Kim <kgene@kernel.org>, Kumar Gala <galak@codeaurora.org>, emil.l.velikov@gmail.com, Ian Campbell <ijc+devicetree@hellion.org.uk>, Gustavo Padovan <gustavo.padovan@collabora.co.uk>, Kishon Vijay Abraham I <kishon@ti.com>, Pawel Moll <pawel.moll@arm.com>, ajaynumb@gmail.com, robherring2@gmail.com, Andy Yan <andy.yan@rock-chips.com>, dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org, linux-rockchip@lists.infradead.org, linux-arm-kernel@lists.infradead.org
List-Id: linux-samsung-soc@vger.kernel.org

Hi Javier,

On 10/20/2015 05:48 PM, Javier Martinez Canillas wrote:
> Hello Yakir,
>
> On 10/20/2015 04:10 AM, Yakir Yang wrote:
>> Hi Javier,
>>
>> On 10/19/2015 06:40 PM, Javier Martinez Canillas wrote:
>>> Hello Yakir,
>>>
>>> On 10/10/2015 05:35 PM, Yakir Yang wrote:
>>>> Hi all,
>>>>
>>>>      The Samsung Exynos eDP controller and Rockchip RK3288 eDP controller
>>>> share the same IP, so a lot of parts can be re-used. I split the common
>>>> code into bridge directory, then rk3288 and exynos only need to keep
>>>> some platform code. Cause I can't find the exact IP name of exynos dp
>>>> controller, so I decide to name dp core driver with "analogix" which I
>>>> find in rk3288 eDP TRM :)
>>>>
>>>> But  there are still three light registers setting differents bewteen
>>>> exynos and rk3288.
>>>> 1. RK3288 have five special pll resigters which not indicata in exynos
>>>>      dp controller.
>>>> 2. The address of DP_PHY_PD(dp phy power manager register) are different
>>>>      between rk3288 and exynos.
>>>> 3. Rk3288 and exynos have different setting with AUX_HW_RETRY_CTL(dp debug
>>>>      register).
>>>>
>>>> This series have been well tested on Rockchip platform with eDP panel
>>>> on Jerry Chromebook and Display Port Monitor on RK3288 board and thanks
>>>> to Javier@Samsung help me to find a way to install mainline kernel to
>>>> Samsung Exynos Chromebooks, so this series also have been tested on Samsung
>>>> Snow and Peach Pit Chromebooks which borrowed from my friends.
>>>>
>>>> Besides, This version was build on linux-next branch (tag next-20150918), and
>>>> the above test experiments also base on that tag. But I know the latest tag is
>>>> next-20151009, so i do rebase this series again on next-20151009, there were
>>>> little conflicts(exynos_dp removed the suspend/resume).
>>>>
>>>> But after I retest this series on next-20151009, I saw kernel crashed in mmc
>>>> driver(dw_mci_probe failed to get regulator). So i have to disabled the MMC
>>>> module(after all I boot with USB device), and I can see eDP light up normally
>>>> in startup stage, but kernel keep crashed when it try to mount the filesystem.
>>>> I thought this isn't related to dp driver directly, so i choice not to debug
>>>> more depth.
>>>>
>>>> That's to say if someone want to test this series, I suggest you applied this
>>>> series on tag-20150918, just need to fix some light conflicts with the 01 & 02
>>>> patches (or just email me, I can send you directly).
>>>>
>>>> Thanks,
>>> Do you have a branch that I can use to test this series?
>> Thank you for your kind assistance, I have created a tree which checkout from the next-20151019. Surely there were some conflicts to applied this series on that tag, but things still works for me, here is the git address [https://github.com/yakir-Yang/linux/tree/analogix_dp]
>>
> I tested your branch on an Exynos5800 Peach Pi Chromebook and display is
> working on boot. I also tested DPMS and S2R and things are still working
> so for the whole series feel free to add:
>
> Tested-by: Javier Martinez Canillas <javier@osg.samsung.com>

Thanks a lot    ;)

- Yakir

>> Best regards,
>> - Yakir
>>
> Best regards,
