Received: from out-179.mta1.migadu.com (out-179.mta1.migadu.com [95.215.58.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5E6821E091
	for <linux-samsung-soc@vger.kernel.org>; Tue, 11 Feb 2025 13:29:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739280574; cv=none; b=FphCv1/Lvx9uHyLjEix+dboOoFZErSWN0pdksqzFgvlEw3gaIxT5k8SnwhcJ7rqbswUkBTjEJ3/8fnsl+Z3ew8fVLwNs0KywpC4n+vcCegeNZR4XSOQoogCHX7ie6p/hGjs4Lqxteg2zS/XacsVV+Sj0r4gMAuqWnmxYiPGnI9w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739280574; c=relaxed/simple;
	bh=mjpIa2XgFmm6zQMA4pXnY2mees84ECC2FENB0WxODPI=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=O1ShFi7hpcvasmmooOxN/zJTiGC6M/n2PRjJa67DvVG4UwnClgJ4Ar2O1JHXSonrsX1tqam04X1QAmMcd9RwY8PsoJX5bd63kukBBeanFNZtWv8zyUCjId8RFcv8WXin5a4PalVr7An2DTJJJHzrhEUq2UaSn+9fw/qaTbKIHkQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=cknow.org; spf=pass smtp.mailfrom=cknow.org; dkim=pass (2048-bit key) header.d=cknow.org header.i=@cknow.org header.b=F76PrS/S; arc=none smtp.client-ip=95.215.58.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=cknow.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cknow.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cknow.org header.i=@cknow.org header.b="F76PrS/S"
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cknow.org; s=key1;
	t=1739280569;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=mjpIa2XgFmm6zQMA4pXnY2mees84ECC2FENB0WxODPI=;
	b=F76PrS/Srf+TRRk4IpALolWISlQCHaKg2b1va2BOB6rNkQcsP1j2VWNnabRLhH+dz3q0gJ
	CXcMXeItjojp36cU3MVppUnZPhrnenfB5ABnwjugZZpa4xAaYr7Bs/mtM+bMyeUOAArSzg
	kT0mBGGTr4yHcAPRvb7sTImS2xszkZvUCqRIe33uc8lqBh2Nxa+AaftUYu89Ez4ZSFsNR1
	4q2Qy2Rq5po7/cY6G68tPzhOanFUwjAyqdHBamjx0VayA75QmjMBNMctRAW4AvznsidD2Q
	OW1uRE1SbELrVvXINRCoO+wlPKP+YBQ71S0s28xgjC0Mh7nsBkVRqcFdAlSQGw==
Content-Type: multipart/signed;
 boundary=7740a347bdd2a901409a1a992506960e6d5f504e0ca01f0028a982de32c2;
 micalg=pgp-sha256; protocol="application/pgp-signature"
Date: Tue, 11 Feb 2025 14:29:14 +0100
Message-Id: <D7PNI0953LQN.2PZC72166IWZI@cknow.org>
Cc: <linux-kernel@vger.kernel.org>, <linux-samsung-soc@vger.kernel.org>,
 <devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <kernel-team@android.com>, <willmcvicker@google.com>,
 <peter.griffin@linaro.org>, <daniel.lezcano@linaro.org>,
 <vincent.guittot@linaro.org>, <ulf.hansson@linaro.org>, <arnd@arndb.de>,
 "Krzysztof Kozlowski" <krzysztof.kozlowski@linaro.org>
Subject: Re: [PATCH v8 1/3] dt-bindings: firmware: add google,gs101-acpm-ipc
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: "Diederik de Haas" <didi.debian@cknow.org>
To: "Krzysztof Kozlowski" <krzk@kernel.org>, =?utf-8?q?Andr=C3=A9_Draszik?=
 <andre.draszik@linaro.org>, "Tudor Ambarus" <tudor.ambarus@linaro.org>,
 "Rob Herring" <robh@kernel.org>, "Krzysztof Kozlowski"
 <krzk+dt@kernel.org>, "Conor Dooley" <conor+dt@kernel.org>, "Alim Akhtar"
 <alim.akhtar@samsung.com>, "Jassi Brar" <jassisinghbrar@gmail.com>
References: <20250211-gs101-acpm-v8-0-01d01f522da6@linaro.org>
 <20250211-gs101-acpm-v8-1-01d01f522da6@linaro.org>
 <D7PJTD3PSP78.27N2S94J2CNZG@cknow.org>
 <bad87f30-0483-48c1-b263-02cc752c77e6@linaro.org>
 <a740a0211c82aaaa55940e2f07e1d1b53c23ddd8.camel@linaro.org>
 <e2bdc9aa-2cbb-4fcc-8c73-5fcdad6e18a7@kernel.org>
In-Reply-To: <e2bdc9aa-2cbb-4fcc-8c73-5fcdad6e18a7@kernel.org>
X-Migadu-Flow: FLOW_OUT

--7740a347bdd2a901409a1a992506960e6d5f504e0ca01f0028a982de32c2
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8

On Tue Feb 11, 2025 at 1:05 PM CET, Krzysztof Kozlowski wrote:
> On 11/02/2025 13:02, Andr=C3=A9 Draszik wrote:
>> On Tue, 2025-02-11 at 11:57 +0000, Tudor Ambarus wrote:
>>> And then I shall s/MODULE_LICENSE("GPL");/MODULE_LICENSE("GPL v2");/
>>> everywhere as "GPL" indicates [GNU Public License v2 or later].
>>=20
>> No, please don't, see Documentation/process/license-rules.rst.
> For the rest of suggestions here I also recommend rereading docs. I
> don't get why we need to change "GPL-2.0 OR BSD-2-Clause", but maybe I
> miss some docs. Whatever SPDX recommends is irrelevant if kernel
> recommends for example something else, so be sure you make it aligned
> with actual kernel preference.

Unfortunately, ``Documentation/process/license-rules.rst`` and
``LICENSES/preferred/GPL-2.0`` are not in 'sync', but I guess that's
(potentially) a discussion for another ML.

TL;DR: ``license-rules.rst`` says "GPL-2.0" while the license file
allows both.

References:
9376ff9ba298 ("LICENSES/GPL2.0: Add GPL-2.0-only/or-later as valid identifi=
ers")

https://lore.kernel.org/all/20180422220833.078058446@linutronix.de/
(which mentions specifying the SPDX version, but that didn't get
implemented)

*sigh*

--7740a347bdd2a901409a1a992506960e6d5f504e0ca01f0028a982de32c2
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQT1sUPBYsyGmi4usy/XblvOeH7bbgUCZ6tQsgAKCRDXblvOeH7b
bkINAP4+7weuoA3/bh9F/SLY1BknW+ahnGc5zXCYKj9qsFSqnwD/cZ/OQbjuOQv2
9Mh1NVnF7KOLhSoOL6Rt+VNblLWmiwE=
=N8XC
-----END PGP SIGNATURE-----

--7740a347bdd2a901409a1a992506960e6d5f504e0ca01f0028a982de32c2--
