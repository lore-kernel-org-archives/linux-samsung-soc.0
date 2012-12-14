From: Thomas Abraham <thomas.abraham@linaro.org>
Subject: Re: [PATCH 1/3] pinctrl: exynos: add exynos5250 SoC specific data
Date: Fri, 14 Dec 2012 21:26:17 +0530
Message-ID: <CAJuYYwTZkzCXjowhKaJ253Oji07eDdEjMvNssyL1ThWtETswSQ@mail.gmail.com>
References: <1355399644-29417-1-git-send-email-thomas.abraham@linaro.org>
	<1355399644-29417-2-git-send-email-thomas.abraham@linaro.org>
	<CACRpkdaQ10CgoFXtk4EyqL4LWVpsdEAdrmy5R-_Rqm5fJdqS4A@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CACRpkdaQ10CgoFXtk4EyqL4LWVpsdEAdrmy5R-_Rqm5fJdqS4A@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, kgene.kim@samsung.com, t.figa@samsung.com, patches@linaro.org
List-Id: linux-samsung-soc@vger.kernel.org

Hi Linus,

On 14 December 2012 21:21, Linus Walleij <linus.walleij@linaro.org> wrote:
> On Thu, Dec 13, 2012 at 12:54 PM, Thomas Abraham
> <thomas.abraham@linaro.org> wrote:
>
>> Add Samsung Exynos5250 SoC specific data to enable pinctrl support for
>> all platforms based on Exynos5250.
>>
>> Signed-off-by: Thomas Abraham <thomas.abraham@linaro.org>
>
> Acked-by: Linus Walleij <linus.walleij@linaro.org>
>
> For this series, I guess you'll fix it through the Samsung tree?

Thanks for your ack. Since there are patches to be prepared for
migrating the rest of Exynos5250 related code to the pinctrl
framework, it would be easier if this series goes through the Samsung
tree.

Thanks,
Thomas.

>
> Yours,
> Linus Walleij
