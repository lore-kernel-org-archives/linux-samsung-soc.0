From: Sachin Kamat <sachin.kamat@linaro.org>
Subject: [PATCH 1/1] clk: samsung: Fix compilation error
Date: Tue, 26 Mar 2013 16:18:18 +0530
Message-ID: <1364294898-22618-1-git-send-email-sachin.kamat@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-kernel@vger.kernel.org
Cc: thomas.abraham@linaro.org, kgene.kim@samsung.com, linux-samsung-soc@vger.kernel.org, sachin.kamat@linaro.org, patches@linaro.org
List-Id: linux-samsung-soc@vger.kernel.org

=46ixes the below compilation error during non-dt build.
drivers/clk/samsung/clk.c: In function =E2=80=98samsung_clk_of_register=
_fixed_ext=E2=80=99:
drivers/clk/samsung/clk.c:252:2: error:
implicit declaration of function =E2=80=98for_each_matching_node_and_ma=
tch=E2=80=99
[-Werror=3Dimplicit-function-declaration]
drivers/clk/samsung/clk.c:252:60: error: expected =E2=80=98;=E2=80=99 b=
efore =E2=80=98{=E2=80=99 token

Signed-off-by: Sachin Kamat <sachin.kamat@linaro.org>
---
 drivers/clk/samsung/clk.c |    2 ++
 1 files changed, 2 insertions(+), 0 deletions(-)

diff --git a/drivers/clk/samsung/clk.c b/drivers/clk/samsung/clk.c
index 91d12f3..78615dd 100644
--- a/drivers/clk/samsung/clk.c
+++ b/drivers/clk/samsung/clk.c
@@ -239,6 +239,7 @@ void __init samsung_clk_register_gate(struct samsun=
g_gate_clock *list,
  * obtain the clock speed of all external fixed clock sources from dev=
ice
  * tree and register it
  */
+#ifdef CONFIG_OF
 void __init samsung_clk_of_register_fixed_ext(
 			struct samsung_fixed_rate_clock *fixed_rate_clk,
 			unsigned int nr_fixed_rate_clk,
@@ -255,6 +256,7 @@ void __init samsung_clk_of_register_fixed_ext(
 	}
 	samsung_clk_register_fixed_rate(fixed_rate_clk, nr_fixed_rate_clk);
 }
+#endif
=20
 /* utility function to get the rate of a specified clock */
 unsigned long _get_rate(const char *clk_name)
--=20
1.7.4.1
