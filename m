From: Javier Martinez Canillas <javier.martinez@collabora.co.uk>
Subject: [PATCH 0/2] clk: Some fixes for the per-user clk API changes.
Date: Wed, 11 Feb 2015 11:13:29 +0100
Message-ID: <1423649612-31746-1-git-send-email-javier.martinez@collabora.co.uk>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Mike Turquette <mturquette@linaro.org>
Cc: Stephen Boyd <sboyd@codeaurora.org>, Tomeu Vizoso <tomeu.vizoso@collabora.com>, =?UTF-8?q?Emilio=20L=C3=B3pez?= <emilio@elopez.com.ar>, linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org, Javier Martinez Canillas <javier.martinez@collabora.co.uk>
List-Id: linux-samsung-soc@vger.kernel.org

Hello,

I found a couple of issues with todays' next (tag next-20150211) when
booting an Exynos5420 Peach Pit Chromebook. These were regressions
introduced when converting the clk API to return a per-user clk.

This series is composed of the following trivial fixes:

Javier Martinez Canillas (2):
  clk: Don't dereference parent clock if is NULL
  clk: composite: Set clk_core to composite rate and mux components

 drivers/clk/clk-composite.c | 2 ++
 drivers/clk/clk.c           | 2 +-
 2 files changed, 3 insertions(+), 1 deletion(-)

Best regards,
Javier
