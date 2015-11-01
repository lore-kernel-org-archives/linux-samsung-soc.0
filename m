From: Krzysztof Kozlowski <k.kozlowski@samsung.com>
Subject: Re: [PATCH 1/2] mfd: sec-core: Rename MFD and regulator names differently
Date: Sun, 1 Nov 2015 13:15:05 +0900
Message-ID: <CAJKOXPfcbzMtCEpsXponF6j=K1oL6F_iA-b8i2c33KZK_gab9g@mail.gmail.com>
References: <1446202913-20467-1-git-send-email-alim.akhtar@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1446202913-20467-1-git-send-email-alim.akhtar@samsung.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Alim Akhtar <alim.akhtar@samsung.com>
Cc: lee.jones@linaro.org, broonie@kernel.org, Krzysztof Kozlowski <k.kozlowski@samsung.com>, linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org

2015-10-30 20:01 GMT+09:00 Alim Akhtar <alim.akhtar@samsung.com>:
> Currently S2MPSXX multifunction device is named as *-pmic,
> and this MFD also supports regulator as a one of its MFD cell which
> has the same name, which is a bit confusing.
>
> We did discussed different approaches about how the MFD and it
> cells need to be named here [1].
> Based in the discussion this patch rename MFD regulator name as
> *-regulator instead of current *-pmic.
>
> [1]-> https://lkml.org/lkml/2015/10/28/417
>
> Suggested-by: Lee Jones <lee.jones@linaro.org>
> Signed-off-by: Alim Akhtar <alim.akhtar@samsung.com>
> ---
>  drivers/mfd/sec-core.c |    8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)

Two comments from my side:
1. Lee already pointed issue with bisectability. This is a requirement.
2. What is missing in commit is the reason. Answer to question: Why?
The answer is in LKML discussion but it should be provided here - in
commit: because current naming is confusing and we want to sort it
out.

Best regards,
Krzysztof
