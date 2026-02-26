Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF26239447F;
	Thu, 26 Feb 2026 08:46:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772095584; cv=none; b=IVu+eclaqAi3tddW3ihBH/HXdNlBnvXfj2B/x+nKKNDRxcu2mHe2m6Fl0Orj21fTkNQi4Dg6G8tR2dvF3zzZoc9IrJTRyyTWH8d+yEHc0X4pHGjZsJAvlbFjDNBwq+2QULpkLIifh2CfcXFINNPsgNF2Yl3AB7g8mmCrbO0sYQs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772095584; c=relaxed/simple;
	bh=8EKuGux5/UZ8IwnFOps1Y3r1CNwywMJO9iez4oQSWko=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=VISvFgqEUZ2nN+DdKRVynu4e2CZheL6SupOtfEKRJKHTBG1bLRsND2DQt0mFwLElbDAQJ9kEIF2irbejm0zMSJq3q6vGhvj6mBAxpG2xqPLsIbEAp4OUMZiZbSGeGoQenEgFFcHARiI3TChwf7bToqlaKurbBsIXFMiSVeEfY6s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=he8d6KdB; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="he8d6KdB"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C5333C19422;
	Thu, 26 Feb 2026 08:46:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772095583;
	bh=8EKuGux5/UZ8IwnFOps1Y3r1CNwywMJO9iez4oQSWko=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=he8d6KdBCEQd3IH+E1YdrXxljExN33iIfdqKrOdJoDTbpa09R4rvdJZBsoNxqvEz7
	 XMbZ9rvlGsZQjR1GT8kXv6HIktqyEL1gHAjUK9wR/OWVHdpelt5c64I34n3Tt+eRvr
	 QRohTIhAxAcAt5l9BJDDUxA9JZDP/nCWb0t0YKcb9GqnYBO1MMWffEiJIWfBCG1+AQ
	 oSjMEHuIeBAKHUhvSS9hMH+P38tfODrCV8jfu5SNZNOY8xpyu2p2uAaewaLE1yvjjJ
	 N++rUgW9Me9oQ1lHw3uXGCVGqf6rvNmTUz7gHM58IU5Al8fBOagBTNbDzxbdkiUbfa
	 nLN0LPL8izs0Q==
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Tudor Ambarus <tudor.ambarus@linaro.org>, Rob Herring <robh@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>, 
 Mark Brown <broonie@kernel.org>, Lee Jones <lee@kernel.org>, 
 Bartosz Golaszewski <brgl@bgdev.pl>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Linus Walleij <linusw@kernel.org>, 
 Bartosz Golaszewski <brgl@kernel.org>, 
 =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Cc: Peter Griffin <peter.griffin@linaro.org>, 
 Will McVicker <willmcvicker@google.com>, Juan Yescas <jyescas@google.com>, 
 kernel-team@android.com, linux-kernel@vger.kernel.org, 
 linux-samsung-soc@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-gpio@vger.kernel.org
In-Reply-To: <20260210-s2mpg1x-regulators-v8-1-c429d709c0e0@linaro.org>
References: <20260210-s2mpg1x-regulators-v8-1-c429d709c0e0@linaro.org>
Subject: Re: [PATCH v8] dt-bindings: firmware: google,gs101-acpm-ipc: add
 S2MPG11 secondary PMIC
Message-Id: <177209557950.28320.174050275228667996.b4-ty@kernel.org>
Date: Thu, 26 Feb 2026 09:46:19 +0100
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.14.3


On Tue, 10 Feb 2026 12:42:32 +0000, André Draszik wrote:
> In a typical system using the Samsung S2MPG10 PMIC, an S2MPG11 is used
> as a sub-PMIC.
> 
> The interface for both is the ACPM firmware protocol, so update the
> binding to allow the relevant node and update the example here to
> describe the connection for both PMICs.
> 
> [...]

Applied, thanks!

[1/1] dt-bindings: firmware: google,gs101-acpm-ipc: add S2MPG11 secondary PMIC
      https://git.kernel.org/krzk/linux/c/f2e83070febf61fc72765cdc28d2a45c89b77ce4

Best regards,
-- 
Krzysztof Kozlowski <krzk@kernel.org>

