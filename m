Received: from layka.disroot.org (layka.disroot.org [178.21.23.139])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7752827FB30;
	Wed, 18 Jun 2025 14:32:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.21.23.139
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750257131; cv=none; b=FBAfkKVMy8iqYtHtX2UdS3cw8UQ4pBL5osqghRWdVYNbCtWNK4Tp8BHIePYLALuy2BOzcrG7UIkq1D/n+Dd5hXGLM2BSzkryGYK84QACcoANuP84kL/YKbnCT7SijAF+VwYFMwlULaCbpHjdxa/M5V4uIXVfp6t5Tow7aqhJEv4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750257131; c=relaxed/simple;
	bh=cicdrtZh663PWbSEKE4hOM5LhEMjv/zDMK4ao90EPD4=;
	h=MIME-Version:Date:From:To:Cc:Subject:In-Reply-To:References:
	 Message-ID:Content-Type; b=BN3t894vEy+zDMcPx0GdSvWH5qHYUpRrYzBfYezEqDhCm7RfgffJQ2ydb4+LmO7Ux7/T/AEMNy7HYPJxNt+CxT4X6Gn3u/IE+cTISd11iLLenuqxvQEG9mo2JG87Ou1oPSg2fW4M6UJNxfRFe2ioXyah/G5tXHL9r2PGb6qPU6Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=disroot.org; spf=pass smtp.mailfrom=disroot.org; dkim=pass (2048-bit key) header.d=disroot.org header.i=@disroot.org header.b=bfogrMgv; arc=none smtp.client-ip=178.21.23.139
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=disroot.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=disroot.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=disroot.org header.i=@disroot.org header.b="bfogrMgv"
Received: from mail01.disroot.lan (localhost [127.0.0.1])
	by disroot.org (Postfix) with ESMTP id 1C8A325C7E;
	Wed, 18 Jun 2025 16:32:08 +0200 (CEST)
X-Virus-Scanned: SPAM Filter at disroot.org
Received: from layka.disroot.org ([127.0.0.1])
 by localhost (disroot.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 47V5HVKOwdqE; Wed, 18 Jun 2025 16:32:07 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=disroot.org; s=mail;
	t=1750257127; bh=cicdrtZh663PWbSEKE4hOM5LhEMjv/zDMK4ao90EPD4=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References;
	b=bfogrMgv7T1arQVWMn++RUlfeiHxF+VbYu+NGxeeHjNrZFMhUPNPgdxmExzqmxjps
	 qguKkX+78TMTVDLiwMlg8YCtKV37LwBXZ29sjqAkTR6jyQpS92LfueOPPLKZBeUZp5
	 +mhlnF+XkEqzwoIcqr4P1GkcMVYVhzl0hyFwmDZc/q7EQhgKkXCjljg6LifbEgLZLu
	 wSSJOEmv2DctErS6/FY3ZDC8un0MLoF/yyE3xPGUFqhuDy+z3NJ2go6GLvFXqOVBo9
	 Bbs8fyKx/DqU3jTpvwYVbo+Kx/da/ZOwZEdElCde/LRYHaxlNxe5IdCNM8aadeuABQ
	 RGEAwDVjn+3/g==
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Date: Wed, 18 Jun 2025 14:32:07 +0000
From: Kaustabh Chakraborty <kauschluss@disroot.org>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/5] dt-bindings: samsung: exynos-sysreg: add exynos7870
 sysregs
In-Reply-To: <7bb375c8-1a43-40e2-891c-8815c9cc94ff@kernel.org>
References: <20250612-exynos7870-drm-dts-v1-0-88c0779af6cb@disroot.org>
 <20250612-exynos7870-drm-dts-v1-1-88c0779af6cb@disroot.org>
 <7bb375c8-1a43-40e2-891c-8815c9cc94ff@kernel.org>
Message-ID: <76df5b2d6b2c8de73519e1862e105c67@disroot.org>
X-Sender: kauschluss@disroot.org
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On 2025-06-18 09:46, Krzysztof Kozlowski wrote:
> On 12/06/2025 17:23, Kaustabh Chakraborty wrote:
>> Add sysreg compatible strings for the Exynos7870 SoC. Two sysregs are
>> added, used for the SoC MIPI PHY's CSIS and DSIM blocks.
>> 
>> Signed-off-by: Kaustabh Chakraborty <kauschluss@disroot.org>
>> ---
>>  .../devicetree/bindings/soc/samsung/samsung,exynos-sysreg.yaml      | 6 ++++++
>>  1 file changed, 6 insertions(+)
>> 
>> diff --git a/Documentation/devicetree/bindings/soc/samsung/samsung,exynos-sysreg.yaml b/Documentation/devicetree/bindings/soc/samsung/samsung,exynos-sysreg.yaml
>> index d27ed6c9d61ea9db77229eca60b6b9a0abc5d305..174bdb8ee932ff965de6fc17aef004a3cedffeb3 100644
>> --- a/Documentation/devicetree/bindings/soc/samsung/samsung,exynos-sysreg.yaml
>> +++ b/Documentation/devicetree/bindings/soc/samsung/samsung,exynos-sysreg.yaml
>> @@ -52,6 +52,12 @@ properties:
>>                - samsung,exynosautov9-sysreg
>>            - const: syscon
>>          deprecated: true
>> +      - items:
>> +          - enum:
>> +              - samsung,exynos7870-cam-sysreg
>> +              - samsung,exynos7870-disp-sysreg
>> +          - const: samsung,exynos7870-sysreg
> 
> 
> Drop. These are not really compatible or your commit msg is incomplete.
> Don't use deprecated syntax and backwards compatible solutions for new
> hardware.

Are you sure? The deprecated one is actually the item above. From what I
understand, those are generic sysregs and don't mention their functions.

      - items:
          - enum:
              - samsung,exynos5433-sysreg
              - samsung,exynos850-sysreg
              - samsung,exynosautov9-sysreg
          - const: syscon
        deprecated: true

> 
> Best regards,
> Krzysztof
