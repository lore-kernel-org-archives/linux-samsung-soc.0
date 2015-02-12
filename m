From: Javier Martinez Canillas <javier.martinez@collabora.co.uk>
Subject: [PATCH v2 0/3] clk: Some fixes for the per-user clk API changes.
Date: Thu, 12 Feb 2015 14:58:27 +0100
Message-ID: <1423749510-14525-1-git-send-email-javier.martinez@collabora.co.uk>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Mike Turquette <mturquette@linaro.org>
Cc: Stephen Boyd <sboyd@codeaurora.org>, Tomeu Vizoso <tomeu.vizoso@collabora.com>, =?UTF-8?q?Emilio=20L=C3=B3pez?= <emilio@elopez.com.ar>, Peter De Schrijver <pdeschrijver@nvidia.com>, Robert Jarzmik <robert.jarzmik@free.fr>, Giuseppe Cavallaro <peppe.cavallaro@st.com>, linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org, Javier Martinez Canillas <javier.martinez@collabora.co.uk>
List-Id: linux-samsung-soc@vger.kernel.org

Hello,

This is a v2 of a series to fix some issues found on linux-next after the
per-user clk API changes were introduced. Booting an Exynos5420 Peach Pit
Chromebook and using a composite clock makes the system to crash due a
NULL pointer dereference error.

A previous version of the series is [0] and this addresses issues pointed
out by Stephen Boyd.

This series is composed of the following patches:

Javier Martinez Canillas (3):
  clk: Don't dereference parent clock if is NULL
  clk: Add __clk_hw_set_clk helper function
  clk: Replace explicit clk assignment with __clk_hw_set_clk

 drivers/clk/clk-composite.c    | 20 ++++++++++----------
 drivers/clk/clk.c              |  4 ++--
 drivers/clk/pxa/clk-pxa.c      |  2 +-
 drivers/clk/st/clk-flexgen.c   | 20 ++++++++++----------
 drivers/clk/st/clkgen-mux.c    | 14 +++++++-------
 drivers/clk/tegra/clk-periph.c | 14 +++++++-------
 include/linux/clk-provider.h   |  6 ++++++
 7 files changed, 43 insertions(+), 37 deletions(-)

Best regards,
Javier

[0]: https://lkml.org/lkml/2015/2/11/139
