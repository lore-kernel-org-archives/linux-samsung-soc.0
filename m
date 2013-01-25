From: Kukjin Kim <kgene.kim@samsung.com>
Subject: RE: [PATCH 2/2] cpufreq: exynos: Initialise return variable
Date: Fri, 25 Jan 2013 10:26:41 -0800
Message-ID: <013c01cdfb29$86d37b90$947a72b0$@samsung.com>
References: <1358932932-14094-1-git-send-email-sachin.kamat@linaro.org>
 <1358932932-14094-2-git-send-email-sachin.kamat@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout4.samsung.com ([203.254.224.34]:26646 "EHLO
	mailout4.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S932179Ab3AYS1D convert rfc822-to-8bit (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 25 Jan 2013 13:27:03 -0500
Received: from epcpsbgm2.samsung.com (epcpsbgm2 [203.254.230.27])
 by mailout4.samsung.com
 (Oracle Communications Messaging Server 7u4-24.01(7.0.4.24.0) 64bit (built Nov
 17 2011)) with ESMTP id <0MH70096E1X18OH0@mailout4.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Sat, 26 Jan 2013 03:27:01 +0900 (KST)
Received: from visitor4lab ([105.128.18.157])
 by mmp2.samsung.com (Oracle Communications Messaging Server 7u4-24.01
 (7.0.4.24.0) 64bit (built Nov 17 2011))
 with ESMTPA id <0MH700HTM1WZGZ50@mmp2.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Sat, 26 Jan 2013 03:27:01 +0900 (KST)
In-reply-to: <1358932932-14094-2-git-send-email-sachin.kamat@linaro.org>
Content-language: en-us
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: 'Sachin Kamat' <sachin.kamat@linaro.org>, linux-samsung-soc@vger.kernel.org
Cc: rjw@sisk.pl, jhbird.choi@samsung.com, patches@linaro.org

Sachin Kamat wrote:
>=20
> 'ret' is undefined when the function returns from the first
> 'if' condition. Without this patch we get the following warning:
>=20
> drivers/cpufreq/exynos-cpufreq.c: In function =E2=80=98exynos_target=E2=
=80=99:
> drivers/cpufreq/exynos-cpufreq.c:182:2: warning:
> =E2=80=98ret=E2=80=99 may be used uninitialized in this function [-Wu=
ninitialized]
>=20
> Suggested-by: Jonghwan Choi <jhbird.choi@samsung.com>

I modified above to 'Reported-by' because checkpatch complains like fol=
lowing...

WARNING: Non-standard signature: Suggested-by:
#10:
Suggested-by: Jonghwan Choi <jhbird.choi@samsung.com>

> Signed-off-by: Sachin Kamat <sachin.kamat@linaro.org>
> ---
>  drivers/cpufreq/exynos-cpufreq.c |    2 +-
>  1 files changed, 1 insertions(+), 1 deletions(-)
>=20
Applied, thanks.

- Kukjin
