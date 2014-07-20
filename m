From: Tomasz Figa <tomasz.figa@gmail.com>
Subject: Re: arm-soc boot: 64 boots: 62 pass, 2 fail (v3.16-rc5-727-gac8047e)
Date: Sun, 20 Jul 2014 23:35:54 +0200
Message-ID: <53CC363A.4080907@gmail.com>
References: <53cb00d6.aa91420a.3437.ffff941f@mx.google.com> <CAOesGMj0ms60-=WAeaNhmX9NURpt+wspzgpTiLk1VE3cHB1BjQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-wi0-f177.google.com ([209.85.212.177]:48695 "EHLO
	mail-wi0-f177.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751361AbaGTVgP (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Sun, 20 Jul 2014 17:36:15 -0400
Received: by mail-wi0-f177.google.com with SMTP id ho1so3131174wib.16
        for <linux-samsung-soc@vger.kernel.org>; Sun, 20 Jul 2014 14:36:14 -0700 (PDT)
In-Reply-To: <CAOesGMj0ms60-=WAeaNhmX9NURpt+wspzgpTiLk1VE3cHB1BjQ@mail.gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Olof Johansson <olof@lixom.net>, Kevin's boot bot <khilman@linaro.org>, Kukjin Kim <kgene.kim@samsung.com>, Kukjin Kim <kgene.kim@gmail.com>
Cc: kernel-build-reports@lists.linaro.org, "linaro-kernel@lists.linaro.org" <linaro-kernel@lists.linaro.org>, "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>, Tarek Dakhran <t.dakhran@samsung.com>

+Cc Tarek

On 20.07.2014 21:50, Olof Johansson wrote:
> Kukjin,
> 
> Looks like the last set of branches from you regressed 5410. Since I
> don't have that hardware myself I can't bisect down to what patch is
> causing it.
> 
> Can you please try to sort out at your end and send a fixup patch? I
> think Kevin is out, I haven't seen much from him lately.
> 
> 
> -Olof
> 
> On Sat, Jul 19, 2014 at 4:35 PM, Kevin's boot bot <khilman@linaro.org> wrote:
>>
>> Full logs here: http://armcloud.us/kernel-ci/arm-soc/v3.16-rc5-727-gac8047e
>>
>> Tree/Branch: arm-soc
>> Git describe: v3.16-rc5-727-gac8047e
>> Failed boot tests
>> =================
>>          exynos5410-smdk5410:     FAIL:    arm-multi_v7_defconfig
>>                                   http://armcloud.us/kernel-ci/arm-soc/v3.16-rc5-727-gac8047e/arm-multi_v7_defconfig/boot-exynos5410-smdk5410.html
>>          exynos5410-smdk5410:     FAIL:    arm-exynos_defconfig
>>                                   http://armcloud.us/kernel-ci/arm-soc/v3.16-rc5-727-gac8047e/arm-exynos_defconfig/boot-exynos5410-smdk5410.html
>>
>> Full Report
>> ===========
>>
>> arm-davinci_all_defconfig
>> -------------------------
>>              legacy,dm365evm     0 min 18.5 sec:     PASS
>>                    da850-evm     0 min 16.8 sec:     PASS
>>
>> arm-tegra_defconfig
>> -------------------
>>          tegra124-jetson-tk1     0 min 18.6 sec:     PASS
>>               tegra30-beaver     0 min 18.2 sec:     PASS
>>
>> arm-multi_v7_defconfig+CONFIG_ARM_LPAE=y
>> ----------------------------------------
>>          tegra124-jetson-tk1     0 min 18.6 sec:     PASS
>>   armada-xp-openblocks-ax3-4     0 min 24.6 sec:     PASS
>>                   omap5-uevm     2 min  0.6 sec:     PASS  (Warnings: 1)
>>        sun7i-a20-cubieboard2     0 min 13.7 sec:     PASS
>>
>> arm-mvebu_v7_defconfig+CONFIG_CPU_BIG_ENDIAN=y
>> ----------------------------------------------
>>   armada-xp-openblocks-ax3-4     0 min 24.2 sec:     PASS
>>           armada-370-mirabox     0 min 21.1 sec:     PASS
>>
>> arm-omap2plus_defconfig
>> -----------------------
>>                legacy,3730xm     0 min 42.0 sec:     PASS
>>             am335x-boneblack     0 min 23.2 sec:     PASS
>>              omap3-beagle-xm     0 min 51.5 sec:     PASS
>>            legacy,3530beagle     0 min 34.9 sec:     PASS  (Warnings: 1)
>>                  omap4-panda     0 min 51.8 sec:     PASS
>>             omap3-overo-tobi     0 min 23.9 sec:     PASS
>>                  am335x-bone     0 min 24.9 sec:     PASS
>>       omap3-overo-storm-tobi     0 min 26.0 sec:     PASS
>>                   omap5-uevm     0 min 57.6 sec:     PASS  (Warnings: 1)
>>                   omap3-n900     0 min 18.0 sec:     PASS
>>                  legacy,n900     0 min 16.8 sec:     PASS  (Warnings: 1)
>>               omap4-panda-es     0 min 56.6 sec:     PASS  (Warnings: 1)
>>             legacy,3730storm     0 min 20.7 sec:     PASS
>>             legacy,3530overo     0 min 22.5 sec:     PASS  (Warnings: 1)
>>
>> arm-multi_v7_defconfig
>> ----------------------
>>   imx6dl-wandboard,wand-solo     0 min 16.2 sec:     PASS
>>             am335x-boneblack     0 min 22.9 sec:     PASS
>>        sun7i-a20-cubieboard2     0 min 13.8 sec:     PASS
>>         sun4i-a10-cubieboard     0 min 18.2 sec:     PASS
>>          exynos5410-smdk5410     0 min 49.0 sec:     FAIL
>>                  am335x-bone     0 min 24.5 sec:     PASS
>>          tegra124-jetson-tk1     0 min 18.7 sec:     PASS
>>           armada-370-mirabox     0 min 22.4 sec:     PASS
>>                  omap4-panda     0 min 58.5 sec:     PASS
>>              imx6q-wandboard     0 min 15.1 sec:     PASS
>>   imx6dl-wandboard,wand-dual     0 min 15.9 sec:     PASS
>>                 ste-snowball     1 min 33.8 sec:     PASS
>>               tegra30-beaver     0 min 24.3 sec:     PASS
>>                   omap3-n900     0 min 16.5 sec:     PASS
>>     qcom-apq8074-dragonboard     0 min 20.2 sec:     PASS
>>                  bcm28155-ap     0 min 28.4 sec:     PASS
>>             omap3-overo-tobi     0 min 26.0 sec:     PASS
>>       omap3-overo-storm-tobi     0 min 24.5 sec:     PASS
>>              omap3-beagle-xm     0 min 55.9 sec:     PASS
>>      exynos5420-arndale-octa     0 min 34.9 sec:     PASS
>>   armada-xp-openblocks-ax3-4     0 min 25.6 sec:     PASS
>>                   omap5-uevm     2 min  1.2 sec:     PASS  (Warnings: 1)
>>               omap4-panda-es     0 min 53.4 sec:     PASS  (Warnings: 1)
>>           exynos5250-arndale     0 min 37.8 sec:     PASS
>>
>> arm-sunxi_defconfig
>> -------------------
>>        sun7i-a20-cubieboard2     0 min 12.3 sec:     PASS
>>         sun4i-a10-cubieboard     0 min 12.2 sec:     PASS
>>
>> arm-qcom_defconfig
>> ------------------
>>     qcom-apq8074-dragonboard     0 min 18.0 sec:     PASS
>>
>> arm-bcm_defconfig
>> -----------------
>>                  bcm28155-ap     0 min 23.6 sec:     PASS
>>
>> arm-exynos_defconfig
>> --------------------
>>      exynos5420-arndale-octa     0 min 30.8 sec:     PASS
>>           exynos5250-arndale     0 min 31.4 sec:     PASS
>>          exynos5410-smdk5410     0 min 48.2 sec:     FAIL
>>
>> arm-imx_v6_v7_defconfig
>> -----------------------
>>   imx6dl-wandboard,wand-dual     0 min 16.8 sec:     PASS
>>   imx6dl-wandboard,wand-solo     0 min 17.1 sec:     PASS
>>              imx6q-wandboard     0 min 15.4 sec:     PASS
>>
>> arm-u8500_defconfig
>> -------------------
>>                 ste-snowball     0 min 28.1 sec:     PASS
>>
>> arm-multi_v7_defconfig+CONFIG_CPU_BIG_ENDIAN=y
>> ----------------------------------------------
>>   armada-xp-openblocks-ax3-4     0 min 27.2 sec:     PASS
>>           armada-370-mirabox     0 min 22.9 sec:     PASS
>>
>> arm-mvebu_v7_defconfig
>> ----------------------
>>   armada-xp-openblocks-ax3-4     0 min 23.0 sec:     PASS
>>           armada-370-mirabox     0 min 20.7 sec:     PASS
>>
>> arm-sama5_defconfig
>> -------------------
>>                   sama5d35ek     0 min 16.2 sec:     PASS  (Warnings: 1)
>>
>> _______________________________________________
>> Kernel-build-reports mailing list
>> Kernel-build-reports@lists.linaro.org
>> http://lists.linaro.org/mailman/listinfo/kernel-build-reports
> --
> To unsubscribe from this list: send the line "unsubscribe linux-samsung-soc" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
> 
