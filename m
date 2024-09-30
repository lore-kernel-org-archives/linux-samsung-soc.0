Received: from mail-4322.protonmail.ch (mail-4322.protonmail.ch [185.70.43.22])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD7A62B9A5
	for <linux-samsung-soc@vger.kernel.org>; Mon, 30 Sep 2024 18:24:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.70.43.22
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727720666; cv=none; b=Tr4unXXNtI11ScDbXD4TkFALmTecWJQGh01nBoEPu0OLivY9xwWovsYomqGrUi1F4iH39GwtefOYapzRQgWXDA6HglmIfYHTV4VnanMNGyVScGClTkccoYdvKj9j44mYcoVl9K+C/sViBHJKBo+cFVcNjfTn2vxrp6rWyvhiCeU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727720666; c=relaxed/simple;
	bh=1GMXmfbMI11IFqnuSW1DzOOQUjZN84hJ6CcAPUad+BY=;
	h=Date:To:From:Subject:Message-ID:MIME-Version:Content-Type; b=hWFqVaX/U7D3epx46GSgbF/2mAhVaxTQBID7rjp70Wp5n5ytQLiqeFL0E7WYKYHKWQe+GfNoSbj/YQ+xVef/1QgtCP4Ts6xIvQhrRppsVGtuorBZ5apfgVRqu1uTAfW8+MOQPmU/Y/ILQvNstJCPwhAhlj3RLThASnCJ3efGaeE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=pm.me; spf=pass smtp.mailfrom=pm.me; dkim=pass (2048-bit key) header.d=pm.me header.i=@pm.me header.b=JtbJTx21; arc=none smtp.client-ip=185.70.43.22
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=pm.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pm.me
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=pm.me header.i=@pm.me header.b="JtbJTx21"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pm.me;
	s=protonmail3; t=1727720661; x=1727979861;
	bh=1GMXmfbMI11IFqnuSW1DzOOQUjZN84hJ6CcAPUad+BY=;
	h=Date:To:From:Subject:Message-ID:Feedback-ID:From:To:Cc:Date:
	 Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector;
	b=JtbJTx21o+/FeGHGAZKIKhMkBTgUT8qq25z8xLH/ost0WUEU8+SXugOe+s5Dy7pWw
	 XQ3+uuOL5QCBrHpSDayLY/qjtFbCJuZv++ru1PcuWcbibn/6Nrvm6QYFSZMb3xgeDZ
	 b9ZzrPuZzzTnJe2+xgIO6PLYG1SqS1eFPXdjOoy//IY3DKcK3eJxa0R8Tnvv9pgmfg
	 lYj2pGLBVSyRF/r4mygqLWZFC6tnYBJjbU+h3Fp1hGT2pCM7Xv4DcW4pES++IRPrEp
	 ij4PED7gT0zyp3kC140/+t1ItTH1byzOOLJs/+23LdJeJrkxNGdIUWXhKaungR2Y1B
	 YBfusHzr3AEYQ==
Date: Mon, 30 Sep 2024 18:24:16 +0000
To: "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>
From: rbredhat <rbredhat@pm.me>
Subject: Exynos 9810 and Galaxy S9 (starlte)
Message-ID: <ox4aoUGD6zuhCHC7_mLpi2rzRKjicwSSI-S2L3fhvgVT-es-WoXTm2bYukU7QuWqmGjCO6Xn7rDZtafsHu-SW2OHaPhB8Y91gxEkLcK25nk=@pm.me>
Feedback-ID: 52807168:user:proton
X-Pm-Message-ID: 78c83e658227cffe33550731ac77d4ccdc8d7e05
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Hi,

As a Galaxy S9 (G960F, starlte) owner I'm glad to see the progress on addin=
g the Exynos SoC to the mainstream. Is there any chance that the Exynos 981=
0 will be added as well? There are a huge number of devices based on this S=
oC:
 - https://doc.samsungmobile.com/sm-g960f/dbt/doc.html
 - https://doc.samsungmobile.com/sm-g965f/dbt/doc.html
 - https://doc.samsungmobile.com/sm-n960f/dbt/doc.html
 - https://doc.samsungmobile.com/sm-n770f/dbt/doc.html
 - https://doc.samsungmobile.com/sm-t575/dbt/doc.html
 - https://doc.samsungmobile.com/sm-t577u/xac/doc.html

Currently only the last two devices receive security updates. The rest are =
using severely outdated kernel and drivers. For some devices there is Linea=
geOS support, but there kernel has not been updated for more than a year:
https://wiki.lineageos.org/devices/starlte/
https://github.com/LineageOS/android_kernel_samsung_exynos9810

I am able to build a kernel from source code, but the 4.9 branch is no long=
er supported. My attempts to use a fresh version of the kernel failed due t=
o my lack of programming experience. I have created a document listing the =
components of some of the devices, perhaps it will be useful. I can send th=
e ods file if needed.

https://kdrive.infomaniak.com/app/share/1019122/185f83dd-e5f7-4224-bc76-ebc=
3e7ccb821

Some device versions have Qualcomm SDM845 SoC and are already supported in =
mainstream. It might make it easier to add support for Exynos 9810 based de=
vices. For example,
https://lore.kernel.org/all/20240926-starqltechn_integration_upstream-v5-0-=
d2084672ff2f@gmail.com/

Best


