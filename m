Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 087542D374D;
	Wed,  2 Jul 2025 15:13:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751469199; cv=none; b=AvsB8cQK+zIorjqC4FcDvCitGvml7nb13Mw9qz0FRNsJkgXl1GUtRmqU82ujUxSU2AoHxUxqNiRSlGIauXwKPdiKu7+2fjKoR76p9l/mFv0eSnxJITY/cjwwcnWbBDGFSo6wlyHZjaBusNdhxIGfW7iEVM8p51v5yeTOq1k1QGc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751469199; c=relaxed/simple;
	bh=alMe+83Vtp2h4flrvYWTb1xN0VIzLR4w3aagiHmdsE0=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=KY2HsAIqWVVVmbFDIU44iokxf4DGuvMGXRY5qt3ZUFdcy0sA+bgxgns+zQdlEI3U19NVUGYOy6AXKQ125ooTEdt4aUpykxEx3BleKivySkfYWpP4yN8n5oabb/zel8I9jZuMW44v2MOVPBkEUpS/P1+5S3cywI4zjmDADpubQuA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=AKnVn/E7; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="AKnVn/E7"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 82F91C4CEE7;
	Wed,  2 Jul 2025 15:13:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751469198;
	bh=alMe+83Vtp2h4flrvYWTb1xN0VIzLR4w3aagiHmdsE0=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=AKnVn/E7jaN7kc5wIUHRm7H6UX1gFh78WBUDpcyZkNWUyx3Cq9zcAKWll4I2O3GIZ
	 zG36OlNWuZ7B/uJFzbLbbLFhsvtc2BzgctM5eZQh/VTSZ08uj9iHgL5m+PrWTOgT9V
	 Z4778u61M+4wALe2lzlSg9NQEhm5oKltlBjRNqrb7yj1CGVK340VHqV79sZ0PlYt0b
	 zqznC+MAChghzXVTs6j1PmYnXd7uG9ROTEMgDSj6dUuaLeeRWdLx3/Cnk31TDE+Lr/
	 F+5x+Dlxn7rPOrYTA08Brzjz725xW5R92O+Q0clScG6HccziF7ZvNBH1Olq4oF3vyq
	 bNkZAvQkguKUg==
From: Lee Jones <lee@kernel.org>
To: Krzysztof Kozlowski <krzk@kernel.org>, Lee Jones <lee@kernel.org>, 
 Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
 =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Cc: Peter Griffin <peter.griffin@linaro.org>, 
 Tudor Ambarus <tudor.ambarus@linaro.org>, 
 Will McVicker <willmcvicker@google.com>, kernel-team@android.com, 
 linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org, 
 devicetree@vger.kernel.org
In-Reply-To: <20250627-s2mpg10-binding-comment-v1-1-f37e5187f0fd@linaro.org>
References: <20250627-s2mpg10-binding-comment-v1-1-f37e5187f0fd@linaro.org>
Subject: Re: (subset) [PATCH] dt-bindings: mfd: samsung,s2mps11: add
 comment about interrupts properties
Message-Id: <175146919627.3032353.7383459922795371559.b4-ty@kernel.org>
Date: Wed, 02 Jul 2025 16:13:16 +0100
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.15-dev-c81fc

On Fri, 27 Jun 2025 10:15:25 +0100, André Draszik wrote:
> Document why the binding uses oneOf when specifying just one of the
> interrupt properties is supposed to be enough.
> 
> dtschema's fixups.py has special treatment of the interrupts and
> interrupts-extended properties, but that appears to work at the top
> level only. Elsewhere, an explicit oneOf is required.
> 
> [...]

Applied, thanks!

[1/1] dt-bindings: mfd: samsung,s2mps11: add comment about interrupts properties
      commit: 37f716488780c4ce9e30a17f3c4ff9baee27c96d

--
Lee Jones [李琼斯]

