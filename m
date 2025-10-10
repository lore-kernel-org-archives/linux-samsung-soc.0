Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B0422367B0;
	Fri, 10 Oct 2025 14:33:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760106797; cv=none; b=i+0QaUTgB917asxhHFpiWWuHxUqWRzCuMPz7YYSVzortl2xUfbwoJLS7v8KmzsxZNjL9wBeXoZutrsOBdaknZYXb/umRHoJ5Iv2058GCKeNzItx+FQsE8BI4/KeD93+tMFR2vak7Mbf7uoNZNkTnMGNsNy+pjNG5ofcGBW3wo3M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760106797; c=relaxed/simple;
	bh=m2PXNXrLebhFa6++1XBL2y98d/eheP7r5cvfGNR8yVA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=KxdUVMHBb5Ixq/KXoh5jHs4cojRIfMlT0MF4/HE94/XCgS5Abe8WFsi7VCDxZwqUUT6O2Tb7lxCGYf8CsVo8/Ip+Aaf19vPlHrlfb8HuExQT7ukAaKZbmEu1Uin1gG/DuUAyixJwg25AGfU0MozQL8kLgIvM6/93IW3ersSK+ls=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=rudQa4Cw; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="rudQa4Cw"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C0E5AC4CEF1;
	Fri, 10 Oct 2025 14:33:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1760106796;
	bh=m2PXNXrLebhFa6++1XBL2y98d/eheP7r5cvfGNR8yVA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=rudQa4CwjZPlcEyIjZSD/meAC8K/kcQSLFWXk+zb4u95bUz0GkUzdYbVvZxn0i3bP
	 JsHQPldNp8xjCqCXHwe4gn+Yig8oSdETZUtZjXjnS1BykzpxNxjZdrPiI7pbSxeJdD
	 b9kUcTCTcofCNkeoNMS+rFsRqfP83/CvcX+IIbqqFjk6awPJ2d8u0Y8OaqlG/BVfFx
	 wy8TTmZsckSy+RkniV4NZzLz8MP+vXJL5tX5a/u2dihQaIT5VBCMyBlw5h4UgA3Esh
	 wdnWpHqe7EMBbdR9kfTWOE+5HrAB/JjxULpRjeyjwks44VNfm1Hv+MarEzwhPx7NN2
	 exDyON92tAnCw==
Date: Fri, 10 Oct 2025 09:33:14 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: =?iso-8859-1?Q?Andr=E9?= Draszik <andre.draszik@linaro.org>
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
	Peter Griffin <peter.griffin@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-samsung-soc@vger.kernel.org,
	Krzysztof Kozlowski <krzk+dt@kernel.org>, kernel-team@android.com,
	Tudor Ambarus <tudor.ambarus@linaro.org>,
	linux-arm-kernel@lists.infradead.org,
	Will McVicker <willmcvicker@google.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Michael Turquette <mturquette@baylibre.com>,
	linux-clk@vger.kernel.org
Subject: Re: [PATCH] dt-bindings: clock: google,gs101-clock: add power-domains
Message-ID: <176010679359.249518.14445454979945020127.robh@kernel.org>
References: <20251007-power-domains-clock-google-gs101-clock-v1-1-1ee73c453ba8@linaro.org>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20251007-power-domains-clock-google-gs101-clock-v1-1-1ee73c453ba8@linaro.org>


On Tue, 07 Oct 2025 17:03:10 +0100, André Draszik wrote:
> The CMU can be part of a power domain, so we need to allow the relevant
> property 'power-domains'.
> 
> Signed-off-by: André Draszik <andre.draszik@linaro.org>
> ---
>  Documentation/devicetree/bindings/clock/google,gs101-clock.yaml | 3 +++
>  1 file changed, 3 insertions(+)
> 

Acked-by: Rob Herring (Arm) <robh@kernel.org>

