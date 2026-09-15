Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5073834A797;
	Tue, 15 Sep 2026 06:47:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789454837; cv=none; b=NJUhhsK2DGrrNQEvcumZNUkCP2fDeqFf5syQDtN+O623Z5nIoXB4yErvN5+JIIeUWrElmE9X3jNev7+fLsK2pjh25UxhXIjSvu9dy8gS5mL1oh1CcYwDQlYM+NgonG+kq+qhWkK2A9skP5IE1EEXYiP7fFjL4nzxX4sHHxCrx+c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789454837; c=relaxed/simple;
	bh=RUTPKkmPMFlIEQdXGNZEJIQXstZXuMU19yD8YTIvtRA=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=UwImmajOTS0D46MnLoujQ4llj/KTK09Ett0AKgEPNKZtRLB429R1qo8AKJe2mKNBSWI54ibMHUNVwEB+ET5J4jXZZ2JMPezjOMSBxrtn2KQtIadGlkcxzit3IQjR7+tN3hDcF9AdCgE5d29m5Dm/tSo1oJX5HlYupLHtGG7+ujQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=iuy/T4Q3; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="iuy/T4Q3"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 693BA1F00893;
	Tue, 15 Sep 2026 06:47:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789454835;
	bh=IW+WfSkPhtezIjFB1ttK9J7KCiVxh6V1t2vdBtFn5aE=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=iuy/T4Q3FaiJLSDqC4UAzjteph6/bH9iTwpPHWV5eMCywt9KXhF06u4ciIRo3HDcT
	 ZSiP8ky3z2ByQoMZISqHn0+0qqHZ2i4+6YV725/9BUVcUMX7JnuO2dbFtR9Jbaaolh
	 rxy7/Ag7chmlXrmxJ8CyBfAmc5sHnVyl/vPvQp7THwqinngAbpE/StZqFp/HJw3sWy
	 CTGI5algOIUjmuNFeWXjal5JagW3cEGDHvFydZlFcu6JYS8IZHTRJtjk8zDyuUG5iA
	 whmJTo6rLFq8K/3KUlZenw3XK9HzUXtdeXsTnJ+1yFU0T+RVogXB+Y1UDcMZUBNOJ+
	 PSAZBjuPrlLeg==
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Alim Akhtar <alim.akhtar@samsung.com>, linux-fsd@tesla.com, 
 Peter Griffin <peter.griffin@linaro.org>, Rob Herring <robh@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <20260909-dts-samsung-cleanup-strict-v1-0-1b755a446b22@oss.qualcomm.com>
References: <20260909-dts-samsung-cleanup-strict-v1-0-1b755a446b22@oss.qualcomm.com>
Subject: Re: [PATCH 0/5] arm64: dts: fsd: Cleanups with new dt-style-check
Message-Id: <178945483213.36246.17124860030489038402.b4-ty@b4>
Date: Tue, 15 Sep 2026 08:47:12 +0200
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.16.0


On Wed, 09 Sep 2026 16:17:51 +0200, Krzysztof Kozlowski wrote:
> Only a few warnings are left
> 
> Best regards,
> Krzysztof

Applied, thanks!

[1/5] arm64: dts: fsd: Fix indentation of CPU nodes
      https://git.kernel.org/krzk/linux/c/ee5e4efa733d63fe145a953e16be77633df8a222
[2/5] arm64: dts: fsd: evb: Correct node order
      https://git.kernel.org/krzk/linux/c/d8b0a2d87beeb794b4b235ca6407a7483c747776
[3/5] arm64: dts: fsd: Move idle states out of CPUs node
      https://git.kernel.org/krzk/linux/c/5fc349ef1f37de7d87940c35c25ec2bb0ca5bd6d
[4/5] arm64: dts: fsd: Re-order nodes to match coding style
      https://git.kernel.org/krzk/linux/c/04a4457e3a0dc9a20c516435f8e0e87774df2b7e
[5/5] arm64: dts: fsd: Re-order properties to match coding style
      https://git.kernel.org/krzk/linux/c/b724971c200ca17e565906ad6b248558b3c62e92

Best regards,
-- 
Krzysztof Kozlowski <krzk@kernel.org>

