Received: from netrider.rowland.org (netrider.rowland.org [192.131.102.5])
	by smtp.subspace.kernel.org (Postfix) with SMTP id A44FD13DDAC
	for <linux-samsung-soc@vger.kernel.org>; Fri, 12 Apr 2024 14:58:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.131.102.5
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712933919; cv=none; b=RFJDjfzy061m0jfou+9fbQ0eXN43+aGjXQ0LCb0Q3TC9wVdAPYkd8zNd53j34rftlFvLTzNgiSMiTBIB+u4vrZfvlA61UDuOmGjShfYOV3nvhJIrqoqvU/pO1wMZv1UGPROIlusedo4/6uXbE4ldT8eIhD5Kyw937kq4Qxf+Op8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712933919; c=relaxed/simple;
	bh=04ykC2yq1lC/0hBfCtPKjfa7diXWxuJwzYkmrjfwWJY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=O1VnQjEQLSZ2peqRiojMBEonevrJ+0XzvJnO7/Y8eJEnvydtUQLUxYlzhI2evBRKrS2a81bjExDxlHd6m0L3pmt3Pc+koUr6p0lSSYEFa2FtTdTsoxDG5xrRbAAZzdloejhZT6iS+omQ74LhCaLGY4MKGQfRK5ZbCK5bkjoJAnA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=rowland.harvard.edu; spf=pass smtp.mailfrom=netrider.rowland.org; arc=none smtp.client-ip=192.131.102.5
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=rowland.harvard.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=netrider.rowland.org
Received: (qmail 36889 invoked by uid 1000); 12 Apr 2024 10:58:36 -0400
Date: Fri, 12 Apr 2024 10:58:36 -0400
From: Alan Stern <stern@rowland.harvard.edu>
To: Anand Moon <linux.amoon@gmail.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
  Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
  Alim Akhtar <alim.akhtar@samsung.com>,
  Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
  Johan Hovold <johan@kernel.org>, Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
  linux-usb@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
  linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 1/5] usb: ehci-exynos: Use devm_clk_get_enabled()
 helpers
Message-ID: <d5a36d41-22b2-4970-ad17-adcb60a34506@rowland.harvard.edu>
References: <20240412142317.5191-1-linux.amoon@gmail.com>
 <20240412142317.5191-2-linux.amoon@gmail.com>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240412142317.5191-2-linux.amoon@gmail.com>

On Fri, Apr 12, 2024 at 07:52:50PM +0530, Anand Moon wrote:
> The devm_clk_get_enabled() helpers:
>     - call devm_clk_get()
>     - call clk_prepare_enable() and register what is needed in order to
>      call clk_disable_unprepare() when needed, as a managed resource.
> 
> This simplifies the code and avoids the calls to clk_disable_unprepare().
> 
> Signed-off-by: Anand Moon <linux.amoon@gmail.com>
> ---

For patches 1 - 4:

Reviewed-by: Alan Stern <stern@rowland.harvard.edu>
