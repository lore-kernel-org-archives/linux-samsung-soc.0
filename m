Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6830728C872;
	Wed, 16 Jul 2025 08:41:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752655280; cv=none; b=hIZGfMPS9j6fmZ/FmHY+OwWHMnVcuMrAZl3y34ugOk6QQ8tr6/dH6ZxI1Shg5N2hm384fmfbgZVeLLRD9x8ztzlDeqj5KfHd2A8oKJtZTzBs9xMcW6Dp5u3qnyFHnY39jAQMty+GGA96bCXxaqCLdAoJZWn/I7jmdSUUHZIHl8M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752655280; c=relaxed/simple;
	bh=0+WOy5N4Wq3snD7NvD+H4Fh3UVRhj/iQmytnfA43dDE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=n0wMxQJANF/32+7CyyMCHUUDsXyvBsktTZ2PPLPR9kmCqEKiWfo2cKc0w9rUOJ8jaEtNbpnRp5e00QJVqsTIQ1WEVdhgw5fWf+Ee7ip310M8LslCszIwKDUNPxnv1wnMO3iU9aglpGKkR2E0IEGSkl77pivpzHnKr9SLImCfA+Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=mXcsjtaQ; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="mXcsjtaQ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5E47CC4CEF0;
	Wed, 16 Jul 2025 08:41:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1752655279;
	bh=0+WOy5N4Wq3snD7NvD+H4Fh3UVRhj/iQmytnfA43dDE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=mXcsjtaQuLuCQK95PpAG438InUY40J0xnZ4LC0h8NfAL+mKPeJv+07Q00qVA5xlsq
	 GwxzwLOO66AD1hO0dC+0KukrkUv8yRQuDaWVbndxDUiKMKdPY2ycdqNsDalMcRrAIO
	 6ZqaJZR69G4bkHJrwaZOXo7gyw0y3opuR3typqakd/aZFDWDiyhVk2nCUy6QCkFqa6
	 a2y4Uf+JvU2hIIyMWzP4bJvfmFyJWmRmMabDd5S7llEW088wDf6AFaaZbbUEOpHCDV
	 h3alUYE6e6ikQemyB6LTSkoAf7K9xcdlro3GCxZTGOfRRkjy3MzjgBccvG72FJAgny
	 wQ2ZHvbP0A95Q==
Date: Wed, 16 Jul 2025 10:41:17 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Sowon Na <sowon.na@samsung.com>
Cc: robh@kernel.org, conor+dt@kernel.org, vkoul@kernel.org, 
	alim.akhtar@samsung.com, kishon@kernel.org, krzk+dt@kernel.org, 
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, linux-samsung-soc@vger.kernel.org
Subject: Re: [PATCH 3/5] dt-bindings: soc: samsung: exynos-sysreg: add hsi2
 for ExynosAutov920
Message-ID: <20250716-sage-tanuki-of-discourse-aa6a2a@krzk-bin>
References: <20250702013316.2837427-1-sowon.na@samsung.com>
 <CGME20250702013332epcas2p4ea41cc442d42fd7b2c742e1d08b26182@epcas2p4.samsung.com>
 <20250702013316.2837427-4-sowon.na@samsung.com>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250702013316.2837427-4-sowon.na@samsung.com>

On Wed, Jul 02, 2025 at 10:33:09AM +0900, Sowon Na wrote:
> Add hsi2 compatible for ExynosAutov920 ufs shareability register to
> set io coherency of the ExynosAutov920 ufs.
> 
> Signed-off-by: Sowon Na <sowon.na@samsung.com>
> ---
>  .../devicetree/bindings/soc/samsung/samsung,exynos-sysreg.yaml   | 1 +
>  1 file changed, 1 insertion(+)
> 

You combined in this patchset three subsystems. That's not helping...

Best regards,
Krzysztof

