From: Sachin Kamat <sachin.kamat@linaro.org>
Subject: Re: [PATCH 2/2] dt-bindings: clock: Move exynos-audss-clk.h to dt-bindings/clock
Date: Thu, 6 Mar 2014 12:04:07 +0530
Message-ID: <CAK9yfHwLRV_Wj+O=tNEGWw2g4oR9t1-O9bNwozfwv+WOPkjpoQ@mail.gmail.com>
References: <1394085884-13081-1-git-send-email-tushar.behera@linaro.org>
	<1394085884-13081-3-git-send-email-tushar.behera@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-ob0-f182.google.com ([209.85.214.182]:64166 "EHLO
	mail-ob0-f182.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750947AbaCFGeI (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 6 Mar 2014 01:34:08 -0500
Received: by mail-ob0-f182.google.com with SMTP id uz6so2144423obc.41
        for <linux-samsung-soc@vger.kernel.org>; Wed, 05 Mar 2014 22:34:07 -0800 (PST)
In-Reply-To: <1394085884-13081-3-git-send-email-tushar.behera@linaro.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Tushar Behera <tushar.behera@linaro.org>
Cc: linux-arm-kernel <linux-arm-kernel@lists.infradead.org>, linux-samsung-soc <linux-samsung-soc@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, linux-doc@vger.kernel.org, "robh+dt@kernel.org" <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Rob Landley <rob@landley.net>, linux@maxim.org.za, plagnioj@jcrosoft.com, Kukjin Kim <kgene.kim@samsung.com>, Tomasz Figa <t.figa@samsung.com>

On 6 March 2014 11:34, Tushar Behera <tushar.behera@linaro.org> wrote:
> Most of the clock related dt-binding header files are located in
> dt-bindings/clock folder. It would be good to keep all the similar
> header files at a single location.
>
> Signed-off-by: Tushar Behera <tushar.behera@linaro.org>
> CC: Kukjin Kim <kgene.kim@samsung.com>
> CC: Tomasz Figa <t.figa@samsung.com>
> ---

Sensible move.
Reviewed-by: Sachin Kamat <sachin.kamat@linaro.org>

Now that the dt-bindings/clk folder is empty (with these 2 patches
applied), it can be deleted as well.

-- 
With warm regards,
Sachin
