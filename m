From: KOBAYASHI Yoshitake <yoshitake.kobayashi@toshiba.co.jp>
Subject: Re: [PATCH v3 2/5] [SCSI] ufshcd: UFS UTP Transfer requests handling
Date: Thu, 29 Mar 2012 10:40:47 +0900
Message-ID: <4F73BD9F.7090301@toshiba.co.jp>
References: <1330497714-26504-3-git-send-email-santoshsy@gmail.com> <4F6FF1E3.7080908@toshiba.co.jp> <CALMYJDvvY_7FpiVGuguK8i1C_n9ogJhrgsH+KerDc62Omn35aA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from imx9.toshiba.co.jp ([202.33.96.51]:51087 "EHLO
	imx9.toshiba.co.jp" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S932422Ab2C2B4n (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 28 Mar 2012 21:56:43 -0400
In-Reply-To: <CALMYJDvvY_7FpiVGuguK8i1C_n9ogJhrgsH+KerDc62Omn35aA@mail.gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Santosh Y <santoshsy@gmail.com>
Cc: James Bottomley <James.Bottomley@hansenpartnership.com>, linux-scsi@vger.kernel.org, patches@linaro.org, linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org, arnd.bergmann@linaro.org, saugata.das@linaro.org, dsaxena@linaro.org, stephen.doel@linaro.org, venkat@linaro.org, ilho215.lee@samsung.com, nala.la@samsung.com, girish.shivananjappa@linaro.org, vishak.g@samsung.com, k.rajesh@samsung.com, yejin.moon@samsung.com, sreekumar.c@samsung.com, vinholikatti@gmail.com, linkinjeon@gmail.com, michaelc@cs.wisc.edu

Santosh Y wrote:
>> +               case READ_12:
>> +               case WRITE_12:
>
> Just a minor change, this will be READ_16 and WRITE_16.

Thanks. Your feedback will be correct.
