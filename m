From: Marek Szyprowski <m.szyprowski@samsung.com>
Subject: Re: [PATCH v4 9/9] drm/exynos: add support for 'hdmi' clock
Date: Mon, 02 Feb 2015 13:54:54 +0100
Message-ID: <54CF739E.2070407@samsung.com>
References: <1421756219-21037-1-git-send-email-m.szyprowski@samsung.com>
 <1421756219-21037-10-git-send-email-m.szyprowski@samsung.com>
 <CAOMZO5BSvxvbM0nOHk2ogY0j23PwazFCMikiiEv-XtHae3=L_g@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout3.w1.samsung.com ([210.118.77.13]:51940 "EHLO
	mailout3.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754233AbbBBMy6 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 2 Feb 2015 07:54:58 -0500
Received: from eucpsbgm2.samsung.com (unknown [203.254.199.245])
 by mailout3.w1.samsung.com
 (Oracle Communications Messaging Server 7u4-24.01(7.0.4.24.0) 64bit (built Nov
 17 2011)) with ESMTP id <0NJ5006SBAQCXZ20@mailout3.w1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Mon, 02 Feb 2015 12:59:00 +0000 (GMT)
In-reply-to: <CAOMZO5BSvxvbM0nOHk2ogY0j23PwazFCMikiiEv-XtHae3=L_g@mail.gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Fabio Estevam <festevam@gmail.com>
Cc: "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, linux-samsung-soc@vger.kernel.org, jy0922.shim@samsung.com, Tobias Jakobi <Liquid.Acid@gmx.net>, Tomasz Figa <tomasz.figa@gmail.com>, DRI mailing list <dri-devel@lists.freedesktop.org>, Daniel Drake <drake@endlessm.com>, Inki Dae <inki.dae@samsung.com>, Andrzej Hajda <a.hajda@samsung.com>, Kyungmin Park <kyungmin.park@samsung.com>, Kukjin Kim <kgene@kernel.org>, Javier Martinez Canillas <javier.martinez@collabora.co.uk>

Hello,

On 2015-01-22 14:00, Fabio Estevam wrote:
> On Tue, Jan 20, 2015 at 10:16 AM, Marek Szyprowski
> <m.szyprowski@samsung.com> wrote:
>
>> +       mixer_res->hdmi = devm_clk_get(dev, "hdmi");
>> +       if (IS_ERR(mixer_res->hdmi)) {
>> +               dev_err(dev, "failed to get clock 'hdmi'\n");
>> +               return -ENODEV;
> 'return PTR_ERR(mixer_res->hdmi);' would be better.

ok.

>
>> +       }
>> +
>>          mixer_res->sclk_hdmi = devm_clk_get(dev, "sclk_hdmi");
>>          if (IS_ERR(mixer_res->sclk_hdmi)) {
>>                  dev_err(dev, "failed to get clock 'sclk_hdmi'\n");
>> @@ -1095,6 +1102,7 @@ static void mixer_poweron(struct exynos_drm_manager *mgr)
>>          pm_runtime_get_sync(ctx->dev);
>>
>>          clk_prepare_enable(res->mixer);
>> +       clk_prepare_enable(res->hdmi);
> Better check whether clk_prepare_enable failed.

This will be handled by a separate patch, because checking for error 
values from
clk_repare_enable is missing almost all over the Exynos DRM driver.

Best regards
-- 
Marek Szyprowski, PhD
Samsung R&D Institute Poland
