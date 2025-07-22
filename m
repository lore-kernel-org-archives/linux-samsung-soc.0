Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F35B20CCDC;
	Tue, 22 Jul 2025 16:34:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753202058; cv=none; b=G9oHQ8POhuWATYPaBaXEzGwo1Jquu6jD+wClX5Tg4YliV4ph7M8C6rLIHfvQJ3O9RHzMIahvikdLfuJh83X1TP904YKl1sTbDXd/jSwLZxXk61d6wlBgfsiYK7zPXDBFIdidlNHVvK9oQJCavfmEFdmBQYKp5f2Vepojl4tzfqo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753202058; c=relaxed/simple;
	bh=aP0kRJnomYTNmKcx92VJhprLZ5W2ThM9Yi65CH9ynA0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=V8oYfCxRuFh24Xm5b1+x/3E3rN8u8rts7Pi7jzZXl2VxA1FC8fxFRXcNJ3eN1U2kPpIAii969kagOFVQMTCux9peFAbBGoMv5iYmJj8kOnWMY5hzNvO/jRQs5JL21njkna5tUpc65sdXXPugD/1gqFdmCgvWDrGL62IF54VUulc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=SUA84AF3; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="SUA84AF3"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A86E0C4CEEB;
	Tue, 22 Jul 2025 16:34:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1753202058;
	bh=aP0kRJnomYTNmKcx92VJhprLZ5W2ThM9Yi65CH9ynA0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=SUA84AF31j/BjwV6SDkZ2aGqvUGYg/QxwTcRFuaVaEHs0nz4sogzQ+HsnSRo62JrC
	 Kj5L6kuMXoX8yWeLhspJ1z/pHLNWH3qdA17mCbBY9dorWlS6P3pyTWf5EFmznQq/5c
	 Fz4bTAWBbsorgHA94aAyTIp0CLFmJ3sEPyJe2IWb1BBQjGeseVFzZrV1F9ViT3/1g9
	 1ImLafdQQ80H0W82fahVsYLAs7HQ/djpaKb1J42Gh59CZB38i8w1xogHSMvUuSx3F0
	 vtzcoKWuwaia0JhtxaJmH+YyNLXebiPWOQlJ9YYtY9mW7SlvEIhEBvTov1l/YWbgIW
	 paI9oAIHTX5mw==
Date: Tue, 22 Jul 2025 22:04:08 +0530
From: Manivannan Sadhasivam <mani@kernel.org>
To: Peter Griffin <peter.griffin@linaro.org>
Cc: Vinod Koul <vkoul@kernel.org>, 
	Kishon Vijay Abraham I <kishon@kernel.org>, =?utf-8?B?QW5kcsOp?= Draszik <andre.draszik@linaro.org>, 
	Tudor Ambarus <tudor.ambarus@linaro.org>, Alim Akhtar <alim.akhtar@samsung.com>, 
	Krzysztof Kozlowski <krzk@kernel.org>, linux-phy@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, kernel-team@android.com, 
	William Mcvicker <willmcvicker@google.com>
Subject: Re: [PATCH v2 1/2] phy: add new phy_notify_pmstate() api
Message-ID: <e2lhm237c3xtbdjux2wuesq5fwu7nky3w7oq2fnsgn2pqcg5kh@xhxktriooyes>
References: <20250703-phy-notify-pmstate-v2-0-fc1690439117@linaro.org>
 <20250703-phy-notify-pmstate-v2-1-fc1690439117@linaro.org>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250703-phy-notify-pmstate-v2-1-fc1690439117@linaro.org>

On Thu, Jul 03, 2025 at 02:03:22PM GMT, Peter Griffin wrote:
> Add a new phy_notify_pmstate() api that notifies and configures a phy for a
> given PM link state transition.
> 
> This is intended to be by phy drivers which need to do some runtime
> configuration of parameters during the transition that can't be handled by
> phy_calibrate() or phy_power_{on|off}().
> 
> The first usage of this API is in the Samsung UFS phy that needs to issue
> some register writes when entering and exiting the hibernate link state.
> 
> Signed-off-by: Peter Griffin <peter.griffin@linaro.org>
> ---
>  drivers/phy/phy-core.c  | 25 +++++++++++++++++++++++++
>  include/linux/phy/phy.h | 25 +++++++++++++++++++++++++
>  2 files changed, 50 insertions(+)
> 
> diff --git a/drivers/phy/phy-core.c b/drivers/phy/phy-core.c
> index 04a5a34e7a950ae94fae915673c25d476fc071c1..0b29bc2c709890d7fc27d1480a35cda6a826fd30 100644
> --- a/drivers/phy/phy-core.c
> +++ b/drivers/phy/phy-core.c
> @@ -520,6 +520,31 @@ int phy_notify_disconnect(struct phy *phy, int port)
>  }
>  EXPORT_SYMBOL_GPL(phy_notify_disconnect);
>  
> +/**
> + * phy_notify_pmstate() - phy link state notification

'pmstate' doesn't correspond to 'link state'. So how about,
phy_notify_link_state()?

s/phy/PHY (here and below)

> + * @phy: the phy returned by phy_get()
> + * @state: the link state
> + *
> + * Notify the phy of some PM link state transition. Used to notify and

Link state change is common for the PHY. So remove 'PM'.

> + * configure the phy accordingly.
> + *
> + * Returns: %0 if successful, a negative error code otherwise
> + */
> +int phy_notify_pmstate(struct phy *phy, enum phy_linkstate state)

I think you need to use 'int state' and let drivers pass their own link state
values. You cannot have generic link states across all peripherals.

> +{
> +	int ret;
> +
> +	if (!phy || !phy->ops->notify_pmstate)
> +		return 0;
> +
> +	mutex_lock(&phy->mutex);
> +	ret = phy->ops->notify_pmstate(phy, state);

'notify_link_state'

> +	mutex_unlock(&phy->mutex);
> +
> +	return ret;
> +}
> +EXPORT_SYMBOL_GPL(phy_notify_pmstate);
> +
>  /**
>   * phy_configure() - Changes the phy parameters
>   * @phy: the phy returned by phy_get()
> diff --git a/include/linux/phy/phy.h b/include/linux/phy/phy.h
> index 13add0c2c40721fe9ca3f0350d13c035cd25af45..d904ec4edb7e2be41fcf6ab780d3148c2ee8a950 100644
> --- a/include/linux/phy/phy.h
> +++ b/include/linux/phy/phy.h
> @@ -53,6 +53,11 @@ enum phy_media {
>  	PHY_MEDIA_DAC,
>  };
>  
> +enum phy_linkstate {
> +	PHY_UFS_HIBERN8_ENTER,
> +	PHY_UFS_HIBERN8_EXIT,
> +};

Please move these to include/linux/phy/ufs.h as defines.

> +
>  /**
>   * union phy_configure_opts - Opaque generic phy configuration
>   *
> @@ -132,6 +137,18 @@ struct phy_ops {
>  	int	(*connect)(struct phy *phy, int port);
>  	int	(*disconnect)(struct phy *phy, int port);
>  
> +	/**
> +	 * @notify_pmstate:
> +	 *
> +	 * Optional.
> +	 *
> +	 * Used to notify and configure the phy for a PM link state
> +	 * transition.
> +	 *
> +	 * Returns: 0 if successful, an negative error code otherwise

I think you can drop the inline comment and just add to the top level
kernel-doc.

- Mani

-- 
மணிவண்ணன் சதாசிவம்
