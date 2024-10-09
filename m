Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A642919DF9E;
	Wed,  9 Oct 2024 14:29:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728484161; cv=none; b=opeh7ARnCiTYML31UtP5VNAYzXUncvyR+fTqU5u/QmKDcBXob7nonhRY5uFnbtKkfUBqZZ1GQMIVsAOvoPPuM4DYNxqPv4dOzcCRveqlmu1DJQexw03liEcJNEgy/turZYgIrri120dVlGCe8qhCl2axHoqTY9NIXOS/YiVOFUQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728484161; c=relaxed/simple;
	bh=yMibYAiModks/eF3ae5sKDWLoMFJXCQ8yG8F9kfxi+M=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=rJGim/yzvgFiHYtnYfApjjuooJ+cr9uk8VquXhAHkstQ29YmJDh57MY4AqZFAiRyG67b1ecl0PqdSX4iDcXrrzzsrITIExJ2w2+8w+9IEGdq5m2zlACOVqux56jtYyv9VTCZwAX15TMj9q7Y7CAPn0AU0KMSwYyz9/aoJXET0Rc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=mGiUVUNt; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="mGiUVUNt"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 42732C4CECD;
	Wed,  9 Oct 2024 14:29:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1728484161;
	bh=yMibYAiModks/eF3ae5sKDWLoMFJXCQ8yG8F9kfxi+M=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=mGiUVUNtBqe1P+djt7JHYpS04sK9Bq6EYLFhj81zFE2CqW+x2NsKkp2jMHRewLS96
	 DGzxStLj3G/sgC/rRfdBaahtqhv4PmCr+2dm2Tbd18KjcZmMzLugifzn5XLP6W8CAd
	 tlWdNPdKUtTvzKNpUUf5wZfy4DNHEhh7rlpLfgM5fjyd7cND0xaTsIAcXHNSKYqKAr
	 rbyz7NCl+EKL8Hinh3RagRnm2L5UxlbVvoUKXX5Y3NTUn0oy9daqO6qhF3BWT3YAwa
	 wEb2jP6sAJgVAspzhXoIA4ewqHai/5exITCeNBaabqqGIw1b8MwMu17pTyNDrE5Xmn
	 rXHAevgCyh9bA==
From: Lee Jones <lee@kernel.org>
To: Krzysztof Kozlowski <krzk@kernel.org>, Lee Jones <lee@kernel.org>, 
 Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Dzmitry Sankouski <dsankouski@gmail.com>
Cc: linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org, 
 devicetree@vger.kernel.org
In-Reply-To: <20240617-starqltechn_integration_upstream-v5-0-ea1109029ba5@gmail.com>
References: <20240617-starqltechn_integration_upstream-v5-0-ea1109029ba5@gmail.com>
Subject: Re: (subset) [PATCH v5 0/3] Add Samsung s2dos05 pmic support
Message-Id: <172848415900.588729.7958149352588097630.b4-ty@kernel.org>
Date: Wed, 09 Oct 2024 15:29:19 +0100
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.13.0

On Thu, 26 Sep 2024 12:47:29 +0300, Dzmitry Sankouski wrote:
> The S2DOS05 is a companion power management IC for the panel and touchscreen
> in smart phones. Provides voltage regulators and
> ADC for power/current measurements.
> 
> 

Applied, thanks!

[1/3] dt-bindings: mfd: add samsung,s2dos05
      commit: 7bde7326deeaab9ae9345e01b4e321218c4679dd
[2/3] mfd: sec-core: add s2dos05 support
      commit: 176b2e5b80c845a6717122afff7eabcb999cec07

--
Lee Jones [李琼斯]

