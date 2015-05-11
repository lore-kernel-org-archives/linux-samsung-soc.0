From: Daniel Lezcano <daniel.lezcano@linaro.org>
Subject: Re: [PATCH 3/3] clocksource: exynos_mct: Remove old platform mct_init()
Date: Mon, 11 May 2015 16:06:25 +0200
Message-ID: <5550B761.9080208@linaro.org>
References: <1430368973-23786-1-git-send-email-k.kozlowski@samsung.com> <1430368973-23786-3-git-send-email-k.kozlowski@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8;
	format=flowed
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1430368973-23786-3-git-send-email-k.kozlowski@samsung.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Krzysztof Kozlowski <k.kozlowski@samsung.com>, Thomas Gleixner <tglx@linutronix.de>, Kukjin Kim <kgene@kernel.org>, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org
Cc: Chanwoo Choi <cw00.choi@samsung.com>, Inki Dae <inki.dae@samsung.com>
List-Id: linux-samsung-soc@vger.kernel.org

On 04/30/2015 06:42 AM, Krzysztof Kozlowski wrote:
> Since commit 228e3023eb04 ("Merge tag 'mct-exynos-for-v3.10' of ...")=
 the
> mct_init() was superseded by mct_init_dt() and is not referenced
> anywhere. Remove it.
>
> Signed-off-by: Krzysztof Kozlowski <k.kozlowski@samsung.com>

Applied to my tree for 4.2

Thanks !

   -- Daniel

--=20
  <http://www.linaro.org/> Linaro.org =E2=94=82 Open source software fo=
r ARM SoCs

=46ollow Linaro:  <http://www.facebook.com/pages/Linaro> Facebook |
<http://twitter.com/#!/linaroorg> Twitter |
<http://www.linaro.org/linaro-blog/> Blog
