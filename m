Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [78.32.30.218])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 25AF333AD8A;
	Wed, 12 Nov 2025 16:14:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=78.32.30.218
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762964059; cv=none; b=o0Im8H6hYHiv9Q9ZWr1xbmle6v0XyI17QdLEIiQchOBqE+ZDv1NhqEphaIsc5klurw2gQmhr8r0XeR5Eombg+5AGWH0BhH8T0HGW4wBSTAYvNu5Uvvro7dyh4S2jjdcMWSQb7uDopQ5oxaPo5IRcf1FLN61fsIPU0yxXgg299Sg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762964059; c=relaxed/simple;
	bh=JDYJ79KTnVqkZey9txzGm33At1Jb9p8E5svWaD6WE8Q=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ZuMpUDoGmvKvAX1P7HrRPnk7WBis9gWINUEn5gbH99ZWW+/7NO5Xp4cWJnFZXiqYyKFNARaxZRfC1681na+tc8zcsM7Jqrrm0Fc+jQD22cE0DOfz7t/BXeqn7A1otYZO6gUcMm7suUXXFNP4s87Ehb8NgRvxJ39fY2EB2cmepb8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=armlinux.org.uk; spf=none smtp.mailfrom=armlinux.org.uk; dkim=pass (2048-bit key) header.d=armlinux.org.uk header.i=@armlinux.org.uk header.b=G+dKewrS; arc=none smtp.client-ip=78.32.30.218
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=armlinux.org.uk
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=armlinux.org.uk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=armlinux.org.uk header.i=@armlinux.org.uk header.b="G+dKewrS"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=0Xm3Jqg8+2+w93tYfaelw64xlHAeRO0zvEeZG7tD2rY=; b=G+dKewrSVXrUAZuM5F125UT8S5
	zaHU7+ocovD/gn4fA6+EswWdZMrDTfbsrTbw14r2Cor1QHzNQcTISEZrJU2WYmMx2qLZD/NEqUPY5
	yPHLkyR4lNokoGZeE6gktrisq9jHWTzYdm5MvpLaRmNbCWzXFBv3JnyQPZ0Xy9Y4eZs6qk/vvkvjc
	0WRVop6jos4sjQmhwoxYumOKXVIqoWSrofKP0mAUZCVzPzOoXBynk8TANECztvxeaL6oDqRs1hknl
	jmow3HcEIXe3rV4TamzKI1JBGpTwwrGJIBIvM0ONW3KgFDI6FuEYaTFy/RzBULsxsCYhvmKS86jUx
	uq7cHWIw==;
Received: from shell.armlinux.org.uk ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:56664)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <linux@armlinux.org.uk>)
	id 1vJDU0-000000004Dt-3Opf;
	Wed, 12 Nov 2025 16:14:08 +0000
Received: from linux by shell.armlinux.org.uk with local (Exim 4.98.2)
	(envelope-from <linux@shell.armlinux.org.uk>)
	id 1vJDTy-0000000041V-0hAR;
	Wed, 12 Nov 2025 16:14:06 +0000
Date: Wed, 12 Nov 2025 16:14:06 +0000
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: Peter Griffin <peter.griffin@linaro.org>
Cc: Vinod Koul <vkoul@kernel.org>,
	Kishon Vijay Abraham I <kishon@kernel.org>,
	=?iso-8859-1?Q?Andr=E9?= Draszik <andre.draszik@linaro.org>,
	Tudor Ambarus <tudor.ambarus@linaro.org>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	linux-phy@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org, kernel-team@android.com,
	William Mcvicker <willmcvicker@google.com>,
	Manivannan Sadhasivam <mani@kernel.org>, neil.armstrong@linaro.org
Subject: Re: [PATCH v4 1/2] phy: add new phy_notify_state() api
Message-ID: <aRSyTst8Vd-Qb2Ha@shell.armlinux.org.uk>
References: <20251112-phy-notify-pmstate-v4-0-717d78009d15@linaro.org>
 <20251112-phy-notify-pmstate-v4-1-717d78009d15@linaro.org>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251112-phy-notify-pmstate-v4-1-717d78009d15@linaro.org>
Sender: Russell King (Oracle) <linux@armlinux.org.uk>

On Wed, Nov 12, 2025 at 04:05:58PM +0000, Peter Griffin wrote:
> +int phy_notify_state(struct phy *phy, union phy_notify state)
...
> @@ -255,6 +266,7 @@ int phy_reset(struct phy *phy);
>  int phy_calibrate(struct phy *phy);
>  int phy_notify_connect(struct phy *phy, int port);
>  int phy_notify_disconnect(struct phy *phy, int port);
> +int phy_notify_state(struct phy *phy, union phy_notify state);
>  static inline int phy_get_bus_width(struct phy *phy)
>  {
>  	return phy->attrs.bus_width;
> @@ -412,6 +424,13 @@ static inline int phy_notify_disconnect(struct phy *phy, int index)
>  	return -ENOSYS;
>  }
>  
> +static inline int phy_notify_phystate(struct phy *phy, union phy_notify state)

Should this be phy_notify_state() ?

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!
