From: Daniel Lezcano <daniel.lezcano@linaro.org>
Subject: Re: [RESEND PATCH v3] clocksource: exynos_mct: fix for sleeping in
 atomic ctx handling cpu hotplug notif.
Date: Mon, 29 Jun 2015 11:19:34 +0200
Message-ID: <55910DA6.4070404@linaro.org>
References: <1426151496-5509-1-git-send-email-d.eppel@samsung.com> <1435324984-7328-1-git-send-email-d.eppel@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8;
	format=flowed
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <stable-owner@vger.kernel.org>
In-Reply-To: <1435324984-7328-1-git-send-email-d.eppel@samsung.com>
Sender: stable-owner@vger.kernel.org
To: Damian Eppel <d.eppel@samsung.com>, tglx@linutronix.de, kgene@kernel.org, k.kozlowski@samsung.com, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org
Cc: m.szyprowski@samsung.com, kyungmin.park@samsung.com, m.jabrzyk@samsung.com, stable@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org

On 06/26/2015 03:23 PM, Damian Eppel wrote:
> This is to fix an issue of sleeping in atomic context when processing
> hotplug notifications in Exynos MCT(Multi-Core Timer).
> The issue was reproducible on Exynos 3250 (Rinato board) and Exynos 5=
420
> (Arndale Octa board).
>
> Whilst testing cpu hotplug events on kernel configured with DEBUG_PRE=
EMPT
> and DEBUG_ATOMIC_SLEEP we get following BUG message, caused by callin=
g
> request_irq() and free_irq() in the context of hotplug notification
> (which is in this case atomic context).

Applied as a 4.2 fix.

Should it be tagged stable@ ?



--=20
  <http://www.linaro.org/> Linaro.org =E2=94=82 Open source software fo=
r ARM SoCs

=46ollow Linaro:  <http://www.facebook.com/pages/Linaro> Facebook |
<http://twitter.com/#!/linaroorg> Twitter |
<http://www.linaro.org/linaro-blog/> Blog
