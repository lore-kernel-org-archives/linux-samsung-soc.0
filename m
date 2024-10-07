Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C5F6E42077;
	Mon,  7 Oct 2024 06:28:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728282491; cv=none; b=aJDCx/tvMhd9x5AI0vcmcGZWJTtTz3vqx0jfFWQVqB6GXj9s0/x/Ji47pP40GF3pcbLa7pfuvc/Cx26AV/o994oQmFVoUPkOeKddAOXoyVf5ukop7LbNQMEFrOCQFVoJC92Oclc9WLk/Gt1sMnTI6ml0zPMFFMwnnvZJz+OavWk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728282491; c=relaxed/simple;
	bh=lJ4huQ20De27ax3+Y1wQiALnCQFPZG0PD8Xv1Wfasgw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=L3NsvMW0J4LnMu8PGf8+mT3f3En1Jyi7qQRanQVxGO6ekkBt21hgBO+y1AfRu4OpQ+FL5ILatLo6QZAQL/GER8vS/iNXBY6G1TFZkkhjB/Sm7da/94rygld82Ksg+g+bxEGOcO+b9bLTW/1/TXmGiBUYPXq4tBrNcKrPexnudV4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=tnXfJXfp; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="tnXfJXfp"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8EF98C4CEC6;
	Mon,  7 Oct 2024 06:28:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1728282491;
	bh=lJ4huQ20De27ax3+Y1wQiALnCQFPZG0PD8Xv1Wfasgw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=tnXfJXfp3RbVsqldQaJi4bpsx6Y3wjpb2Hm3xon9CJQrwcGa7KifO5LESKRawT3U6
	 QzNFLTMmSh5SXHywU0LnyQzEgGPgK1sgki4bG+1FvLnZ7XAB6p3N34zofqm9dG4onT
	 N5eA2UBLOpglmpXEvNe5+2fG/AjegDhen8KFoP102x8inL3TpGHEUxkExrN7NyZF5v
	 gw1oVJpTiu3TFm4D1qErICKhlBeLr20h1wxBdas9XjDHRrzsiCbDjzjuAx1WWi+I0a
	 VkIg1XhX5qrpVAW6B1IdNu+44nVna4WE/NExuXPErYIcrZpciiBm/FnumScard0cXk
	 +WIFPj7TkEZjA==
Date: Mon, 7 Oct 2024 11:58:07 +0530
From: Vinod Koul <vkoul@kernel.org>
To: Peter Griffin <peter.griffin@linaro.org>
Cc: kishon@kernel.org, krzysztof.kozlowski@linaro.org,
	alim.akhtar@samsung.com, tudor.ambarus@linaro.org,
	andre.draszik@linaro.org, kernel-team@android.com,
	willmcvicker@google.com, linux-phy@lists.infradead.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org
Subject: Re: [PATCH 1/3] phy: Add UFS phy hibernate modes
Message-ID: <ZwN/d8l7Mk6x2GHP@vaman>
References: <20241002201555.3332138-1-peter.griffin@linaro.org>
 <20241002201555.3332138-2-peter.griffin@linaro.org>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241002201555.3332138-2-peter.griffin@linaro.org>

Hi Peter,

On 02-10-24, 21:15, Peter Griffin wrote:
> Some UFS phys need to write hibernation specific values
> when entering and exiting hibernate state.
> 
> Add two new UFS phy modes to the phy framework so that this
> is possible. One such platform that requires this is Pixel 6
> which uses the gs101 SoC.
> 
> Signed-off-by: Peter Griffin <peter.griffin@linaro.org>
> ---
>  include/linux/phy/phy.h | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/include/linux/phy/phy.h b/include/linux/phy/phy.h
> index 03cd5bae92d3..1874e55e2bb9 100644
> --- a/include/linux/phy/phy.h
> +++ b/include/linux/phy/phy.h
> @@ -42,7 +42,9 @@ enum phy_mode {
>  	PHY_MODE_MIPI_DPHY,
>  	PHY_MODE_SATA,
>  	PHY_MODE_LVDS,
> -	PHY_MODE_DP
> +	PHY_MODE_DP,
> +	PHY_MODE_UFS_HIBERN8_ENTER,
> +	PHY_MODE_UFS_HIBERN8_EXIT,

I am not sure I like this. why should this be the model? Phy drivers
should listen to pm events and handle this in pm_suspend/resume calls,
why do we need this special mode here...
Also, this is not a "mode" for phy

-- 
~Vinod
