From: Shaik Ameer Basha <shaik.samsung@gmail.com>
Subject: Re: [PATCH v3 2/4] [media] exynos-scaler: Add core functionality for
 the SCALER driver
Date: Tue, 17 Sep 2013 17:17:20 +0530
Message-ID: <CAOD6ATosxtTKBw0T6QqKanLAhaWeEbpj0aC0qRRT+VQoGsr9qg@mail.gmail.com>
References: <1378991371-24428-1-git-send-email-shaik.ameer@samsung.com>
	<1378991371-24428-3-git-send-email-shaik.ameer@samsung.com>
	<52363487.6010408@gmail.com>
	<CAOD6ATpg8M9M=b+8czdVo+oUA2iVFXdvBUTVPOKncBr2Bzac6Q@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-qe0-f49.google.com ([209.85.128.49]:32944 "EHLO
	mail-qe0-f49.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752434Ab3IQLrV (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 17 Sep 2013 07:47:21 -0400
In-Reply-To: <CAOD6ATpg8M9M=b+8czdVo+oUA2iVFXdvBUTVPOKncBr2Bzac6Q@mail.gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Sylwester Nawrocki <sylvester.nawrocki@gmail.com>
Cc: Shaik Ameer Basha <shaik.ameer@samsung.com>, LMML <linux-media@vger.kernel.org>, linux-samsung-soc@vger.kernel.org, Sylwester Nawrocki <s.nawrocki@samsung.com>, posciak@google.com, Inki Dae <inki.dae@samsung.com>, Hans Verkuil <hverkuil@xs4all.nl>

Hi sylwester,

>>
>>
>> Isn't scaler_hw_set_csc_coef() function configuring the colorspace ?
>
> Actually speaking this function should do the color space setting part.
> What the SCALER ip supports is CSC offset value for Y
>
> YCbCr to RGB : Zero offset of -16 offset for input
> RGB to YCbCr : Zero offset of +16 offset for output

small spelling mistake here..

YCbCr to RGB : Zero offset or -16 offset for input
RGB to YCbCr : Zero offset or +16 offset for output

Regards,
Shaik Ameer Basha

>
> I think user should provide this information through some controls.
> Anyways, will take it later.
>
>>
