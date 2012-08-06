From: Sylwester Nawrocki <sylvester.nawrocki@gmail.com>
Subject: Re: [PATCH v3 2/2] ARM: EXYNOS: Add Gscaler device from DT
Date: Mon, 06 Aug 2012 21:09:02 +0200
Message-ID: <5020164E.90007@gmail.com>
References: <1342789723-3949-1-git-send-email-shaik.ameer@samsung.com> <1342789723-3949-3-git-send-email-shaik.ameer@samsung.com> <033301cd6fb0$7ac4af90$704e0eb0$%kim@samsung.com> <CAJuYYwTy5zkeM_cJO7HMm+=v=ORPHD26nQYZwXK6v1noWm1EuA@mail.gmail.com> <5018E656.3070803@samsung.com> <036f01cd6fc4$120a9910$361fcb30$%kim@samsung.com> <50197D66.1050108@gmail.com> <CAOesGMiZMrv4GY=v1WPn_qGZgg=vduO2TbsUOQ6sCah-ZvOg_A@mail.gmail.com> <501B1003.1090003@gmail.com> <CAOD6ATomKE3WYtGrBTSyjfkNr5ZK+3=NRrZLX0p5pOzPykOikQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-ey0-f174.google.com ([209.85.215.174]:50181 "EHLO
	mail-ey0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S932380Ab2HFTJG (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 6 Aug 2012 15:09:06 -0400
Received: by eaac11 with SMTP id c11so949651eaa.19
        for <linux-samsung-soc@vger.kernel.org>; Mon, 06 Aug 2012 12:09:05 -0700 (PDT)
In-Reply-To: <CAOD6ATomKE3WYtGrBTSyjfkNr5ZK+3=NRrZLX0p5pOzPykOikQ@mail.gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Shaik Ameer Basha <shaik.samsung@gmail.com>
Cc: Kukjin Kim <kgene.kim@samsung.com>, Olof Johansson <olof@lixom.net>, Sylwester Nawrocki <s.nawrocki@samsung.com>, Thomas Abraham <thomas.abraham@linaro.org>, Shaik Ameer Basha <shaik.ameer@samsung.com>, linux-samsung-soc@vger.kernel.org, devicetree-discuss@lists.ozlabs.org, sy0816.kang@samsung.com, olofj@google.com, thomas.ab@samsung.com, sachin.kamat@linaro.org, joshi@samsung.com, sungchun.kang@samsung.com, Rob Herring <rob.herring@calxeda.com>

On 08/06/2012 08:27 AM, Shaik Ameer Basha wrote:
> After all this discussion, I can see two possibilities here.
> 1] If Kukjin Kim is sure about G-Scaler remains unchanged, across all
> the exynos5 series SoCs,
>          It is fine to go with the compatible string  "samsung,exynos5-gsc".
> 2] Otherwise in case of any doubts about G-Scaler is going to change,
>          It is safe to go with the compatible string specific to
> current SoC i.e., "samsung,exynos5250-gsc".
> 
> If we all can agree on this, lets Kukjin Kim decide which string to
> use as he has good knowledge about upcoming exynos5 series SoCs.

I don't have strong opinion on this, but my vote goes for using more 
specific properties. Of course the final word belongs to Mr. Kim.

--

Regards,
Sylwester
