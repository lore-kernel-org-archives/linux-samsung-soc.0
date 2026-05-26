Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2980F407CE0
	for <linux-samsung-soc@vger.kernel.org>; Tue, 26 May 2026 17:29:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779816565; cv=none; b=u1ttC7ilH3cAJx6JVOYrqJlu3I2FuaBkPJtHXg0kV2tjVQi9aG62tF86E7ZrJw2XBByIgBQi5+UsrPHr7IlOrZaXbXu2pCgwOu7QGR4B+okhCg+O/trYCrEnHqfjDXST6vJkxONZBACDJbbMpNFGi5pn6Z9Gu71ASVdpGB8mknw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779816565; c=relaxed/simple;
	bh=dzH9YUJG8uGp7VZsW3GaSHh1lAr7wQXf/QvDJfHdEWU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=saOjz7IGK1COa9t5pnGUlGxu37D6VXtA7oNLiKN1ck4fK5PepzbdX/LkBFQLfnglRoIVQu8r9rUXfwj+/pfTlkofF5DfFNzaauF7inodpnitpKpZR440tENRnxGGHPV2clEKO9WwcV0a5Zv7pyzDO9idp0aRxZfDu/NNQujk+Jk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=GOEgraBu; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=eFPDvqNN; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="GOEgraBu";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="eFPDvqNN"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1779816563;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=zcN83KsnuXOBiT0bfhcJ41Oft2jKBo42H4ejVB4MEDk=;
	b=GOEgraBuPzyuEN4IF72Y26LOY02rXHV1Tyg0w8ANvOAaZKqOoEKHPXCCXOLMbo2KoenuKs
	hmwmf6fQOKjOqUPNfAz7cpk2vTPNSjLDbdFnIoOB9kCLBOJh5aUCVtyQgXrCEbU8TmAdk4
	z7vkzqs35eOr+nqaOeuF29IHbYZvNH4=
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com
 [209.85.160.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-582-HdpcxGpRN7ObUHiX944zlw-1; Tue, 26 May 2026 13:29:22 -0400
X-MC-Unique: HdpcxGpRN7ObUHiX944zlw-1
X-Mimecast-MFC-AGG-ID: HdpcxGpRN7ObUHiX944zlw_1779816561
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-516d09e77e6so106036931cf.3
        for <linux-samsung-soc@vger.kernel.org>; Tue, 26 May 2026 10:29:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1779816561; x=1780421361; darn=vger.kernel.org;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zcN83KsnuXOBiT0bfhcJ41Oft2jKBo42H4ejVB4MEDk=;
        b=eFPDvqNNxM5VmVEdm+I44WKFdLapqCDZqIW5kJI9NHXiJPIWmevn7v1o3T7eTtuf9c
         RebKsRpypG3U0NZ2TFivypf14zMJmgD9Gvsh8SxAoIjb9dcfcLK81zTeYtK2diLnINLO
         zEkoEughqvXR2xgH2aYyPdutIhMK6In+4jxUGuWxjHvM8mYJDUKVqbBcSmD4rJJY5BWL
         vBEMtaAu/Vxsjtb09kp80LiHsyNbprr70+LINEa3+OiiRf09zJ6QBkrsboYi9vcz7EBF
         TMZ0nSb3G3f/zT3J4XDTdRMQdJ3oSzo/fXi4wJf49rUqo9iQgEFpIQP9rzI0ZT3+GtPp
         fzlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779816561; x=1780421361;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=zcN83KsnuXOBiT0bfhcJ41Oft2jKBo42H4ejVB4MEDk=;
        b=N0vqQFjBIx6CgQWolJLZDL7Rk+3AYe7+ozgrcRlVYQjal+FPtqTnXQWntlOSfkxeSf
         P6rF4tWlOw0AkXczEHd3Ac9GDVNVgG28KtCmq+ZleUF7BqRwLzsQVeVP2KUu9pYntkvF
         5nw3XARXvdETIqo8ojUXlTKsKFCE2stBgeFknzPfKADMqmP9S+HsSkcy3lVluqh2I0Tq
         c9shbHdbIIcnY4uklplY0QwJJLGk4BCJ98O2/+EE9u5MK5NUnzkxMW/5wQt5sRggKHfr
         1fFb9cA0JcNHXQU5kv21kYGiyJm1Qu7pOsYLvz1tInGTGzZv+994F5Tttirr4kGxLY9k
         CBPw==
X-Forwarded-Encrypted: i=1; AFNElJ/KR892K8HaL7E34smI0yHMrRAbUlTu6qq49HYvC0aVim8pAg4OlIJwf/opyRXb2DXP1AAr+67Rei4eMEgVXF79Qg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yzvhem/PztBU66V+UgMtTu1H7LXp3Vdv8uls0+RNaOLuIDQzb5D
	YWEcB+J9kX/bSGE9ZXgO1Wiwjh65JM6r4rvdMNNils5JRyvPx8uc1aSsrT4D5Q65+8y/iEnHLdi
	0DeI42y/jRep30Vh2yLyQVXeuOVsz4boiL1OWuplB490L4Fxg+Ao4IireiM/2U+zwR64LHZ/C
X-Gm-Gg: Acq92OHwUKuiKL3XjLlHwU4oVUKc22lPEan2Qkjg6crQPvx/lGnFjKCpUL8GjjfZ+no
	IGFxryjETWnaFInykGAyCiieumJ2ErO8/dIoEoUXufizmJBOATsyBhKl0TC48f+TMsjiacZ2Kyl
	eg8kYImgRcicWu64pNLJa+uw/v3fH0I6UH4SaWGieKtI0Oa4f4ObmLz5o3SBOUa4flAzoPJ2Hwd
	DahcpRiWlxVt5ak4gJTZKBv1AQbm9Yn2qKcQacw+XDTwufmlduogvWg1JgQLFuu8j9TljzZJM32
	/OWp5qvOyCKn7wtP79zfmltMFCYeH48u8aiDBrEDV4C2Z5z8jPCL/PuQtyP8DtuHjZ4n26en848
	RT+sjZsC8o2C/pPAFBbPA7pu5wrWuM4Jm17r/ykxOzCqGE+qX7MxfKIJl
X-Received: by 2002:a05:622a:5917:b0:516:f4ef:5c1 with SMTP id d75a77b69052e-516f4ef0d14mr130311151cf.38.1779816561185;
        Tue, 26 May 2026 10:29:21 -0700 (PDT)
X-Received: by 2002:a05:622a:5917:b0:516:f4ef:5c1 with SMTP id d75a77b69052e-516f4ef0d14mr130310671cf.38.1779816560629;
        Tue, 26 May 2026 10:29:20 -0700 (PDT)
Received: from redhat.com (c-73-183-52-120.hsd1.pa.comcast.net. [73.183.52.120])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-51706b08199sm23907171cf.29.2026.05.26.10.29.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 May 2026 10:29:20 -0700 (PDT)
Date: Tue, 26 May 2026 13:29:18 -0400
From: Brian Masney <bmasney@redhat.com>
To: "Alexander A. Klimov" <grandmaster@al2klimov.de>
Cc: Krzysztof Kozlowski <krzk@kernel.org>,
	Sylwester Nawrocki <s.nawrocki@samsung.com>,
	Chanwoo Choi <cw00.choi@samsung.com>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	"open list:SAMSUNG SOC CLOCK DRIVERS" <linux-samsung-soc@vger.kernel.org>,
	"open list:COMMON CLK FRAMEWORK" <linux-clk@vger.kernel.org>,
	"moderated list:ARM/SAMSUNG S3C, S5P AND EXYNOS ARM ARCHITECTURES" <linux-arm-kernel@lists.infradead.org>,
	open list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] clk: samsung: exynos5410: fix refcount leak
Message-ID: <ahXYbqA40wqxk0QT@redhat.com>
References: <20260526061321.6123-1-grandmaster@al2klimov.de>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260526061321.6123-1-grandmaster@al2klimov.de>
User-Agent: Mutt/2.3.1 (2026-03-20)

On Tue, May 26, 2026 at 08:13:12AM +0200, Alexander A. Klimov wrote:
> Every value returned from of_clk_get() is supposed to be cleaned up
> via clk_put() once not needed anymore.
> 
> Fixes: be95d2c7d918 ("clk: samsung: Add support for EPLL on exynos5410")
> Signed-off-by: Alexander A. Klimov <grandmaster@al2klimov.de>

Reviewed-by: Brian Masney <bmasney@redhat.com>

