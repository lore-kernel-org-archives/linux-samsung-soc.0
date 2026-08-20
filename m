Received: from smtp.forwardemail.net (smtp.forwardemail.net [121.127.44.66])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 873B447ACE2
	for <linux-samsung-soc@vger.kernel.org>; Thu, 20 Aug 2026 16:23:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=121.127.44.66
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787242989; cv=none; b=sQDDD3YkGvwG81SnjHr6EXR6911au3zCQXtGXyC5LIjaDHKNtNyofGmvEELa+UnEVEbzv+pJ3H7GyEiP8JdhWNbeVgbXwwtd/z8VRTXm7l8P4umwsPxXykWm1MnXBvD7sSAo/bscBgjr0pezkOfeQ7cGoCOX06MfBUJeMC99awY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787242989; c=relaxed/simple;
	bh=ZPSw7X+V/IEriZWmRyFQlVVjNZ2Ep+utpqo1rK6tLT8=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=eRuGDpHs/kzxbMKtmokKyhK2Vid/Wu2QIDY/0S7wPz1xWQSyHlHtBWhBpMCvRcQd/lgkM4ZGaBkYADctcwJYqlcMbSEgn/5aeiub2pzmzFAV2E5qOZu9GzuZeccRzixx+wNYlb/Z4lvvQsyags2Cj0SApDyYDxZJW3N8jFKQ9bw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lineageos.org; spf=pass smtp.mailfrom=fe-bounces.lineageos.org; dkim=pass (1024-bit key) header.d=lineageos.org header.i=@lineageos.org header.b=r+HFUaR+; arc=none smtp.client-ip=121.127.44.66
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lineageos.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fe-bounces.lineageos.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=lineageos.org header.i=@lineageos.org header.b="r+HFUaR+"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lineageos.org;
 h=MIME-Version: Content-Transfer-Encoding: Content-Type: In-Reply-To:
 References: Message-ID: Date: Subject: CC: To: From; q=dns/txt;
 s=fe-2eefaa527c; t=1787242986;
 bh=E/i8dlYbOpivZAfL2Q3eP0+7bhwO2MbB3pQXOtcJvmE=;
 b=r+HFUaR+y8Hn+uZl/GR/onlEMSiHsbxKSUarbQk04/IoM14BKlZhYkNVME+9JlM6t1orIOUWw
 Ng4NP1VYOICNNwR0ig1RQhSMpour69CKIi03anyOWuzBuot5ICndlp9AOSM30IF/3lq4VES8wgO
 x6o/2zgzsAJZw0y+5XZ95xc=
X-Forward-Email-ID: 6a8729e97f958f0d9fc2403d
X-Forward-Email-Sender: rfc822; thomas_turner@talktalk.net,
 smtp.forwardemail.net, 121.127.44.66
X-Forward-Email-Version: 2.13.16
X-Forward-Email-Website: https://forwardemail.net
X-Complaints-To: abuse@forwardemail.net
X-Report-Abuse: abuse@forwardemail.net
X-Report-Abuse-To: abuse@forwardemail.net
From: "thomas_turner@talktalk.net" <tturner@lineageos.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>, Thomas Turner
	<tturner@lineageos.org>
CC: "semen.protsenko@linaro.org" <semen.protsenko@linaro.org>,
	"robh@kernel.org" <robh@kernel.org>, "krzk+dt@kernel.org"
	<krzk+dt@kernel.org>, "conor+dt@kernel.org" <conor+dt@kernel.org>,
	"peter.griffin@linaro.org" <peter.griffin@linaro.org>,
	"alim.akhtar@samsung.com" <alim.akhtar@samsung.com>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "linux-samsung-soc@vger.kernel.org"
	<linux-samsung-soc@vger.kernel.org>, "devicetree@vger.kernel.org"
	<devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v2 0/2] Exynos850 GPU support
Thread-Topic: [PATCH v2 0/2] Exynos850 GPU support
Thread-Index: AQHdL9tywkiYFsT4dEim8C++1HK05bam/zgAgAABgwCAAACMeIAAHz2A
X-MS-Exchange-MessageSentRepresentingType: 1
Date: Thu, 20 Aug 2026 16:22:59 +0000
Message-ID:
	<GVYP280MB12134B4DF9D6CA15C7867CF8A1A42@GVYP280MB1213.SWEP280.PROD.OUTLOOK.COM>
References:
	<GVYP280MB12139AB976CA7ACF49FEB768A1A52@GVYP280MB1213.SWEP280.PROD.OUTLOOK.COM>
 <20260820142330.84514-1-tturner@lineageos.org>
 <88e40f93-ae65-4eb0-827d-9c33c52bad24@oss.qualcomm.com>
 <GVYP280MB1213F9511E062056470AE74AA1A42@GVYP280MB1213.SWEP280.PROD.OUTLOOK.COM>
In-Reply-To:
	<GVYP280MB1213F9511E062056470AE74AA1A42@GVYP280MB1213.SWEP280.PROD.OUTLOOK.COM>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-Exchange-Organization-SCL: -1
X-MS-TNEF-Correlator:
X-MS-Exchange-Organization-RecordReviewCfmType: 0
msip_labels:
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0


Apologies, I think I am missing the --thread parameter. The command I ran w=
as

git send-email --in-reply-to=3D'<GVYP280MB12139AB976CA7ACF49FEB768A1A52@GVY=
P280MB1213.SWEP280.PROD.OUTLOOK.COM>' \
    --to=3D'etc' \
    --cc=3D'etc' \
    v2-000*.patch


I want to avoid spamming the mailing list with null information so I would =
appreciate some guidance on what I am doing wrong. In regards to your comme=
nt, I left it disabled as I was initially unsure whether the E850-96 Board =
uses Mali G52, however it seems all exynos850 devices share the same GPU, w=
ould it be better to have as status=3D"okay"  ?

As for the comments I believe I already responded to them but I am testing =
this on the Samsung Galaxy A21s and here are some logs I pulled.
[    0.230437] panfrost 11500000.gpu: clock rate =3D 377000000
[    0.230863] panfrost 11500000.gpu: mali-g52 id 0x7212 major 0x0 minor 0x=
0 status 0x0
[    0.230945] panfrost 11500000.gpu: features: 00000000,00000df7, issues: =
00000000,00000400
[    0.231026] panfrost 11500000.gpu: Features: L2:0x07100206 Shader:0x0000=
0000 Tiler:0x00000809 Mem:0x1 MMU:0x00002830 AS:0xff JS:0x7
[    0.231137] panfrost 11500000.gpu: shader_present=3D0x1 l2_present=3D0x1
[    0.232552] panfrost 11500000.gpu: [drm] Using Transparent Hugepage
[    0.233172] [drm] Initialized panfrost 1.6.0 for 11500000.gpu on minor 0

________________________________________
From: thomas_turner@talktalk.net <thomas_turner@talktalk.net>
Sent: Thursday, August 20, 2026 7:39 AM
To: Krzysztof Kozlowski; Thomas Turner
Cc: semen.protsenko@linaro.org; robh@kernel.org; krzk+dt@kernel.org; conor+=
dt@kernel.org; peter.griffin@linaro.org; alim.akhtar@samsung.com; linux-arm=
-kernel@lists.infradead.org; linux-samsung-soc@vger.kernel.org; devicetree@=
vger.kernel.org; linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 0/2] Exynos850 GPU support

Apologies, I think I am missing the --thread parameter. The command I ran w=
as

git send-email --in-reply-to=3D'<GVYP280MB12139AB976CA7ACF49FEB768A1A52@GVY=
P280MB1213.SWEP280.PROD.OUTLOOK.COM>' \
    --to=3D'etc' \
    --cc=3D'etc' \
    v2-000*.patch


I want to avoid spamming the mailing list with null information so I would =
appreciate some guidance on what I am doing wrong. In regards to your comme=
nt, I left it disabled as I was initially unsure whether the E850-96 Board =
uses Mali G52, however it seems all exynos850 devices share the same GPU, w=
ould it be better to have as status=3D"okay"  ?

As for the comments I believe I already responded to them but I am testing =
this on the Samsung Galaxy A21s and here are some logs I pulled.
[    0.230437] panfrost 11500000.gpu: clock rate =3D 377000000
[    0.230863] panfrost 11500000.gpu: mali-g52 id 0x7212 major 0x0 minor 0x=
0 status 0x0
[    0.230945] panfrost 11500000.gpu: features: 00000000,00000df7, issues: =
00000000,00000400
[    0.231026] panfrost 11500000.gpu: Features: L2:0x07100206 Shader:0x0000=
0000 Tiler:0x00000809 Mem:0x1 MMU:0x00002830 AS:0xff JS:0x7
[    0.231137] panfrost 11500000.gpu: shader_present=3D0x1 l2_present=3D0x1
[    0.232552] panfrost 11500000.gpu: [drm] Using Transparent Hugepage
[    0.233172] [drm] Initialized panfrost 1.6.0 for 11500000.gpu on minor 0

________________________________________
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Sent: Thursday, August 20, 2026 7:28 AM
To: Thomas Turner; krzysztof.kozlowski@oss.qualcomm.com
Cc: semen.protsenko@linaro.org; robh@kernel.org; krzk+dt@kernel.org; conor+=
dt@kernel.org; peter.griffin@linaro.org; alim.akhtar@samsung.com; linux-arm=
-kernel@lists.infradead.org; linux-samsung-soc@vger.kernel.org; devicetree@=
vger.kernel.org; linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 0/2] Exynos850 GPU support

On 20/08/2026 16:23, Thomas Turner wrote:
> Hi all,
> This is my first time sending patches to linux so apologies for
> mistakes. This series provides basic GPU support to the Exynos850
> platform, making use of the Mali G52 GPU through the panfrost driver.
>

Again: slow down.

Why does this appear under empty subject thread?

Best regards,
Krzysztof

