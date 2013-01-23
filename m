From: Sachin Kamat <sachin.kamat@linaro.org>
Subject: [PATCH 2/2] cpufreq: exynos: Initialise return variable
Date: Wed, 23 Jan 2013 14:52:12 +0530
Message-ID: <1358932932-14094-2-git-send-email-sachin.kamat@linaro.org>
References: <1358932932-14094-1-git-send-email-sachin.kamat@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-pa0-f44.google.com ([209.85.220.44]:43719 "EHLO
	mail-pa0-f44.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754104Ab3AWJbF (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 23 Jan 2013 04:31:05 -0500
Received: by mail-pa0-f44.google.com with SMTP id hz11so4668787pad.17
        for <linux-samsung-soc@vger.kernel.org>; Wed, 23 Jan 2013 01:31:05 -0800 (PST)
In-Reply-To: <1358932932-14094-1-git-send-email-sachin.kamat@linaro.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: kgene.kim@samsung.com, rjw@sisk.pl, jhbird.choi@samsung.com, sachin.kamat@linaro.org, patches@linaro.org

'ret' is undefined when the function returns from the first
'if' condition. Without this patch we get the following warning:

drivers/cpufreq/exynos-cpufreq.c: In function =E2=80=98exynos_target=E2=
=80=99:
drivers/cpufreq/exynos-cpufreq.c:182:2: warning:
=E2=80=98ret=E2=80=99 may be used uninitialized in this function [-Wuni=
nitialized]

Suggested-by: Jonghwan Choi <jhbird.choi@samsung.com>
Signed-off-by: Sachin Kamat <sachin.kamat@linaro.org>
---
 drivers/cpufreq/exynos-cpufreq.c |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/drivers/cpufreq/exynos-cpufreq.c b/drivers/cpufreq/exynos-=
cpufreq.c
index 88401ba..4268e46 100644
--- a/drivers/cpufreq/exynos-cpufreq.c
+++ b/drivers/cpufreq/exynos-cpufreq.c
@@ -159,7 +159,7 @@ static int exynos_target(struct cpufreq_policy *pol=
icy,
 {
 	struct cpufreq_frequency_table *freq_table =3D exynos_info->freq_tabl=
e;
 	unsigned int index;
-	int ret;
+	int ret =3D 0;
=20
 	mutex_lock(&cpufreq_lock);
=20
--=20
1.7.4.1
