Received: from mout.web.de (mout.web.de [212.227.15.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C454879FD;
	Mon,  8 Jul 2024 18:27:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.15.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720463255; cv=none; b=gBkHT72ryvF7CjlCzLVKOTnTcnPq4hin99xWpxZYdhfdZI1wcPSyb6mGv44eQXbdoY9f7xkCiSe8A0ljzJhc2qRbipYCrt+g4rHHrXnJ2ZSwxW/vEUm6vy1PjkuM6KpgfQIRfMQ/gPq8bHYxbOkKRgMmSalV4eIu8Dwc18RXx34=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720463255; c=relaxed/simple;
	bh=nlMaB/JpuH88DM3GoVX7G0Uuyms0smFzf26TAoL12eY=;
	h=Message-ID:Date:MIME-Version:To:Cc:References:Subject:From:
	 In-Reply-To:Content-Type; b=FFRb2KmIobdBwftU8G7zoygme34lwJsbpCtePlFdHv0WRqPbDb+iiLNEcqUzA8vjHdhqEpjn0I29gV6x5HgmHyOnyyXZ6qQEXLbtStTo5B7mGv4KpEqeNOYDpgKxqSjYotJas7bf7sXTiF2SkHU1PdvnO30pybpsoLcUXn9XLAI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=web.de; spf=pass smtp.mailfrom=web.de; dkim=pass (2048-bit key) header.d=web.de header.i=markus.elfring@web.de header.b=U42852Dn; arc=none smtp.client-ip=212.227.15.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=web.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=web.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=web.de header.i=markus.elfring@web.de header.b="U42852Dn"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=web.de;
	s=s29768273; t=1720463221; x=1721068021; i=markus.elfring@web.de;
	bh=nlMaB/JpuH88DM3GoVX7G0Uuyms0smFzf26TAoL12eY=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:To:Cc:References:
	 Subject:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:
	 cc:content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=U42852DnVa/l/aji1gejCv+ivNU+NkM4U5x6NGXf5TvqMP9Xk2pH/t4Jhzq7X3XP
	 EbD4aiGoae03rLAynmSTj7EcqkN6Jwr1fCcLTNkoFZQsJtpT8hJFyZIqDGsNFpdd4
	 8bIOvTlKrNCaZ3EpRcXQChvanqNrz+C6yAB44ejdhm9s98rz7IBnk/ZJJ4LriY+Kp
	 bH998OUSPjblxjKtXkmw08Myiw9N0yqq7hPxVgkW3TwpNtb67yStLOK4r4qOvxWU4
	 JUroRYfaehz5sQUiK1JL1ikR5EJhq0+vdqCFLF1s3P/aUQIcyyKTwqFhJLl4m0WiE
	 M3TBaNM7ILgLHTVvpg==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from [192.168.178.21] ([94.31.91.95]) by smtp.web.de (mrweb006
 [213.165.67.108]) with ESMTPSA (Nemesis) id 1MYu16-1svjin0mFE-00P4Ko; Mon, 08
 Jul 2024 20:27:01 +0200
Message-ID: <25435c69-d33b-49fe-be7f-c0d93af639fc@web.de>
Date: Mon, 8 Jul 2024 20:26:46 +0200
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Dan Carpenter <dan.carpenter@linaro.org>, linux-phy@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org,
 =?UTF-8?Q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Cc: kernel-janitors@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>,
 Alim Akhtar <alim.akhtar@samsung.com>,
 Kishon Vijay Abraham I <kishon@kernel.org>,
 Krzysztof Kozlowski <krzk@kernel.org>,
 Peter Griffin <peter.griffin@linaro.org>, Rob Herring <robh@kernel.org>,
 Sam Protsenko <semen.protsenko@linaro.org>, Vinod Koul <vkoul@kernel.org>
References: <a956a3e2-c6ce-4f07-ad80-ec8a96e00d16@stanley.mountain>
Subject: Re: [PATCH] phy: exynos5-usbdrd: fix error code in probe()
Content-Language: en-GB
From: Markus Elfring <Markus.Elfring@web.de>
In-Reply-To: <a956a3e2-c6ce-4f07-ad80-ec8a96e00d16@stanley.mountain>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:L1Gdda1KHAXM3MhKUbikQbsc/6T6hLXGu6hHFu4HvtGFPADfB02
 WlMPZMzYETWo0QrMiYcSyNHt23xaeUr92HSMZuqJX1AfiMd5bAuPiNA8FV764pis/yZNtQZ
 osO7PAeDwjfRYpDrD/leT18EEtrcjetiUalGglPNEOYDSSF/qelGMjCQSV4PEKzS5cnX/sZ
 i6VHdDyQUGfeY9oufJM8A==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:2ZYuXBedkdA=;jzqSJq1FcYwTlwfIq9xFK4UBb9t
 p922l9+XcoZ53L1uXsFwWz+btk37W13Xlxmrjm0SIXsCUgrESut+KhOZYXXq7w0p8ZlfQfSJ/
 Jly2DeIhvYmlMB0I1v3D5gFM1zeyBn4j9MRGfibesQnM6oZc33Dj270/8DqhcXZTKOdpfHxCa
 Hx0QKn0qg+cutDaq1IwA6odNYKeU6MjdkGJtzEY7HuDEsBx+AW/Zu/kvkD4uxsMXaTQbJhOYO
 Ol1OXXagRkA3cQpUKRkmgPd20+YgCM3k5fc78/b4efLwi5HeKmeiE3Srin/gqrtSAc1ZPVWNr
 feNTxf3FG5zDHQIajNczj7ByM3OL7Rooohtqgo4tb7gvHGi5LAV52cMxYw4J6AQt1OTfVtUyo
 QubjONSTcweqXpH8EXexcoW5QCTOfqsOhKakO/RS2kW/N0gBtlp4bd+5y2EqnKb1pX1np5JMF
 0gzqWSpidzLsxMcdNhyHQS0kcbX2sS10uEq4wfXkvsDIIfqGFo/h/8npMlG8rOpNC2mDv5j6J
 r7hIVjin5InYgLP6o0/S8UaZhJaOPZkj4jJCS8i1GRQaK6FbJGWkNGfm1Dl9PJHgqn/zoRakP
 xBK7zMRdhcZXrcf73k6EU9KVawX5Hc7lGR3aodOs/esEouNJHvpaMEhPXur3QacaXrXELc/9x
 w5X18yJddD2ZacBidkJEYAVDedkB98dsYeFxFtjGUgGxz1rbG/GWSv4Dl01SVumDR42soFoD7
 SVAK3wyn1DKh+e5jyNvDLTMfQKh8n+vlhWeZyeB3ZAFG30P7z+2LCbqm7VsCBeZq+2ELNgv4e
 RSu8ygyWqtmYw9Kx/3Kvy2+r8/WlsB+r2WaPTiCbSdH8g=

> Return negative -ENOMEM instead of positive ENOMEM.

Would you like to refer to the function name =E2=80=9Cexynos5_usbdrd_phy_p=
robe=E2=80=9D
in the summary phrase?

Regards,
Markus
