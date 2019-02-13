From: Krzysztof Kozlowski <krzk@kernel.org>
Subject: Re: [PATCH v2] mfd: sec: Add support for the RTC on S2MPA01
Date: Wed, 13 Feb 2019 09:09:03 +0100
Message-ID: <CAJKOXPdjeTOPrMK2+ZzMRCPLVotg-NKsefxkjkWUfeCnwaWpmQ@mail.gmail.com>
References: <20190212214639.9613-1-stuart.menefy@mathembedded.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190212214639.9613-1-stuart.menefy@mathembedded.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Stuart Menefy <stuart.menefy@mathembedded.com>
Cc: Sangbeom Kim <sbkim73@samsung.com>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, Lee Jones <lee.jones@linaro.org>, linux-kernel@vger.kernel.org, "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>
List-Id: linux-samsung-soc@vger.kernel.org

On Tue, 12 Feb 2019 at 22:46, Stuart Menefy
<stuart.menefy@mathembedded.com> wrote:
>
> The RTC portion of the S2MPA01 appears to have the same
> register layout as the S2MPS14.
>
> Signed-off-by: Stuart Menefy <stuart.menefy@mathembedded.com>
> ---
>  drivers/mfd/sec-core.c | 2 ++
>  drivers/mfd/sec-irq.c  | 3 +++
>  2 files changed, 5 insertions(+)

Reviewed-by: Krzysztof Kozlowski <krzk@kernel.org>

Best regards,
Krzysztof
