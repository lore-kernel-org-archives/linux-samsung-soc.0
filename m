From: "Rafael J. Wysocki" <rjw@sisk.pl>
Subject: Re: [PATCH 2/2] cpufreq: exynos: Initialise return variable
Date: Fri, 25 Jan 2013 20:58:35 +0100
Message-ID: <56645451.dJrUCdvOAX@vostro.rjw.lan>
References: <1358932932-14094-1-git-send-email-sachin.kamat@linaro.org> <1358932932-14094-2-git-send-email-sachin.kamat@linaro.org> <013c01cdfb29$86d37b90$947a72b0$@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from hydra.sisk.pl ([212.160.235.94]:55943 "EHLO hydra.sisk.pl"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751195Ab3AYTwb convert rfc822-to-8bit (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 25 Jan 2013 14:52:31 -0500
In-Reply-To: <013c01cdfb29$86d37b90$947a72b0$@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Kukjin Kim <kgene.kim@samsung.com>
Cc: 'Sachin Kamat' <sachin.kamat@linaro.org>, linux-samsung-soc@vger.kernel.org, jhbird.choi@samsung.com, patches@linaro.org

On Friday, January 25, 2013 10:26:41 AM Kukjin Kim wrote:
> Sachin Kamat wrote:
> >=20
> > 'ret' is undefined when the function returns from the first
> > 'if' condition. Without this patch we get the following warning:
> >=20
> > drivers/cpufreq/exynos-cpufreq.c: In function =E2=80=98exynos_targe=
t=E2=80=99:
> > drivers/cpufreq/exynos-cpufreq.c:182:2: warning:
> > =E2=80=98ret=E2=80=99 may be used uninitialized in this function [-=
Wuninitialized]
> >=20
> > Suggested-by: Jonghwan Choi <jhbird.choi@samsung.com>
>=20
> I modified above to 'Reported-by' because checkpatch complains like f=
ollowing...
>=20
> WARNING: Non-standard signature: Suggested-by:
> #10:
> Suggested-by: Jonghwan Choi <jhbird.choi@samsung.com>

This tag has been used already, though, and I think it makes sense (mor=
e than
Reported-by in this case).  I think it may be regarded as standard rega=
rdless
of what checkpatch has to say about that. :-)

Thanks,
Rafael


--=20
I speak only for myself.
Rafael J. Wysocki, Intel Open Source Technology Center.
