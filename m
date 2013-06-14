From: Andrew Bresticker <abrestic@google.com>
Subject: Re: [PATCH v2 06/10] clk: exynos5420: register clocks using common
 clock framework
Date: Fri, 14 Jun 2013 10:26:57 -0700
Message-ID: <CAL1qeaFS=MMHJj8TP4vX8-KeXNo0W_EjvhrLsb5=YNsnaqOVXw@mail.gmail.com>
References: <1370516488-25860-10-git-send-email-chander.kashyap@linaro.org>
	<1371218572-8993-1-git-send-email-chander.kashyap@linaro.org>
	<1371218572-8993-7-git-send-email-chander.kashyap@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-serial-owner@vger.kernel.org>
In-Reply-To: <1371218572-8993-7-git-send-email-chander.kashyap@linaro.org>
Sender: linux-serial-owner@vger.kernel.org
To: Chander Kashyap <chander.kashyap@linaro.org>
Cc: "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, linux-samsung-soc <linux-samsung-soc@vger.kernel.org>, linux-serial@vger.kernel.org, Kukjin Kim <kgene.kim@samsung.com>, Tomasz Figa <t.figa@samsung.com>, s.nawrocki@samsung.com, mark.rutland@arm.com, thomas.ab@samsung.com, Thomas Abraham <thomas.abraham@linaro.org>
List-Id: linux-samsung-soc@vger.kernel.org

Hi Chander,

> +       [Core Clocks]
> +
> +  Clock                        ID
> +  ----------------------------
> +
> +  oscclk               1

I know the UM refers to this as 'oscclk', but could we instead call
this 'fin_pll' to be consistent with Exynos 4 and Exynos 5250?

Thanks,
Andrew
