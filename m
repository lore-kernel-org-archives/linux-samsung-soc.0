Received: from mail-oo1-f50.google.com (mail-oo1-f50.google.com [209.85.161.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E0EB19D8A8
	for <linux-samsung-soc@vger.kernel.org>; Fri,  7 Mar 2025 14:12:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741356779; cv=none; b=Bt3HG3TBb6vAuW/lRYf+0jXEJFc0Mhm22Zrkff+m5FmGE+XliD7gbiulWq3i4Y5U0ooJ4puel017B3Rhkkzc5iLTGo0eUcOkmXDw1liUi993fB2q4kuUVO2m2QulurW9lDANedAsAV5NeHjHzL8gUkI67itJA9un6b5EYkktW2Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741356779; c=relaxed/simple;
	bh=60re8BiRqNaxfgjZjOXpMIdToHtt/3wVQ2TQ428IPn8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=vFRxFvDBfH6fHhewOMTKnO4KaSfh9ZPeMQzaCkpM7QXD/9Q2NzLSC6MB1bPnX6vma6OES+iUViGcimBB+nctrKr3j404jyuZDGIH4qr012p5//stUUQOcC/PA6tdo2haG5AHKlok9N7MWFCJFljRnBvpvLXGv6SHEZ7SdSILde0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Q4pF+Hjt; arc=none smtp.client-ip=209.85.161.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Q4pF+Hjt"
Received: by mail-oo1-f50.google.com with SMTP id 006d021491bc7-60010601291so375322eaf.3
        for <linux-samsung-soc@vger.kernel.org>; Fri, 07 Mar 2025 06:12:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1741356776; x=1741961576; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=60re8BiRqNaxfgjZjOXpMIdToHtt/3wVQ2TQ428IPn8=;
        b=Q4pF+Hjt6fmAMzrfiFom+p2VaMdCzP+ZMQ24GRgOHZE7TRwB6OxbesBD2DKj6Cj3ci
         ToBn98bzLWo9oJOg5t6L+s21a9rqnELOW+ljJD/OgZ6G2E+mTpKpRmmJ1s1SIICO8/K5
         MhVbWtTyBYkIeV1W6XJOd/Akzir0XcVkF1FkCIgztuwGYVqjL6OC7bGcDrgI524WxZxj
         Wz9GDm/ZS08h2yeRfCA+hXhcjgrAJXZT4noYghzV9FmRALNq+zCPdXbsGiINwVot3CSa
         thmXXSC+k+H/qToUcqO6YHhWxjQ/8XVo0sMlktoSR2XkdV9U+Nhryhf+6gStokaQ93FL
         3nJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741356776; x=1741961576;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=60re8BiRqNaxfgjZjOXpMIdToHtt/3wVQ2TQ428IPn8=;
        b=Ua0AbVUf3rlJ/iHaWnxIzaBVYeKlzGL5atqvI/dL1mXM+vxfolD5nPDpdxrh+WEmzR
         E4pmm6hNxkJU6MVND3MFMruAvoHeY9MA7ctMWOn4OigDOf+QCSVBg482IkB6HZXUs6XW
         NzJ1YZqWij9mcYjbq4wezqcj5oQjREe+3493BJCGIFKmMv/UsPpeOWAeonV/9Nw6U4pj
         EclolSXlaeppKh4Dq5BRuFSn2HqAJhYxp+5cJ38oI0QNwtPW+cbboi13eK0C0vJrq/My
         JIDzmrmmc1bTyOzmOhKn2Dpe9Dl1fGoUYHH8g4OgCbJ0h7I0G4Jz2mp78WwX3MFGdtEQ
         kgSQ==
X-Forwarded-Encrypted: i=1; AJvYcCXTnO85n8pYiBVrWdYV4qZ4ThtZgTxjFN0MArd38luNFp8LmnhtNvQyJC+R0cCNCsGO0rYGg5qyZddZLtRcn+fqNA==@vger.kernel.org
X-Gm-Message-State: AOJu0YxFaIlsbcHEdj6AEM3VRiG/hu8LdPjjsh66d3FJK2jWwZVNEJqF
	DQUWKOGww469LWWfTc9MOK9tKDOSfYSjWHgauID0FP/JzczC4RXgdifpztClNaa6a4ZwVP76H9P
	Aq5AvlvhdTpp76jfVa2eu+KvfOyoleVE8B9dH8A==
X-Gm-Gg: ASbGnctZbUNONirPxMjhmjJCR6dCrhshmHzHPgVTkIgPCQf1DBdSdwcsBSlXLTQ3L+1
	2QiaLkAATFwF4oRPBqsdMQ0mENTqC18eaJLXTSldwO1/s5fEDnYk39VVXF4JfBD7t4RT2yjYzWy
	C8RnKdpjsMNZAQw8sLRWh54UvWwcM=
X-Google-Smtp-Source: AGHT+IH9L2ObJ6dDXOCpIMSXNSBNafNehee0qnPWJxOsmaTrt6AVB5PDvXlGpGJ+NlBDx4GXdCpmmJeVhirk9krz6vY=
X-Received: by 2002:a4a:ec4c:0:b0:5fe:9a72:3dea with SMTP id
 006d021491bc7-6004a767138mr1732794eaf.1.1741356776690; Fri, 07 Mar 2025
 06:12:56 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250305-clk-samsung-headers-cleanup-v2-0-ea1ae8e9e2bf@linaro.org>
 <20250305-clk-samsung-headers-cleanup-v2-1-ea1ae8e9e2bf@linaro.org>
In-Reply-To: <20250305-clk-samsung-headers-cleanup-v2-1-ea1ae8e9e2bf@linaro.org>
From: Peter Griffin <peter.griffin@linaro.org>
Date: Fri, 7 Mar 2025 14:12:44 +0000
X-Gm-Features: AQ5f1JrAJDWL1aZmpxNwroG6aOpF70B9j3ySId9aUtSrljkJO2C5fdV0SfrMx24
Message-ID: <CADrjBPqxTiy8D8PVpZBzYnes-hxqKX+gd6a4WgJeDE=x7YQKAA@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] clk: samsung: Add missing mod_devicetable.h header
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, Sylwester Nawrocki <s.nawrocki@samsung.com>, 
	Chanwoo Choi <cw00.choi@samsung.com>, Alim Akhtar <alim.akhtar@samsung.com>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Sam Protsenko <semen.protsenko@linaro.org>, =?UTF-8?Q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, 
	Tudor Ambarus <tudor.ambarus@linaro.org>, linux-samsung-soc@vger.kernel.org, 
	linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Wed, 5 Mar 2025 at 20:03, Krzysztof Kozlowski
<krzysztof.kozlowski@linaro.org> wrote:
>
> Add an include for <mod_devicetable.h> in the drivers which use
> of_device_id table to bring its declaration directly, not through some
> other headers.
>
> Reviewed-by: Tudor Ambarus <tudor.ambarus@linaro.org>
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---

Reviewed-by: Peter Griffin <peter.griffin@linaro.org>
