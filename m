Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="k8ZaViC5"
Received: from mail-qt1-x82f.google.com (mail-qt1-x82f.google.com [IPv6:2607:f8b0:4864:20::82f])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6681A10F
	for <linux-samsung-soc@vger.kernel.org>; Thu, 14 Dec 2023 08:04:34 -0800 (PST)
Received: by mail-qt1-x82f.google.com with SMTP id d75a77b69052e-4259a275fa9so56732091cf.2
        for <linux-samsung-soc@vger.kernel.org>; Thu, 14 Dec 2023 08:04:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1702569873; x=1703174673; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=SSa6pGgyJKtkWWJBgToju2bl1vy3r2pnMsbZh5DB9Rw=;
        b=k8ZaViC5niKSXKLvN8bgBRfcYUJdLHHnwI+tMZvyCA0szFQuyF/bAVdVX7lsPmXR6U
         8syXSznM3RszohJFz5N5l22ikfPu6cWI+YGV8QfKqS+irMLPAIOtjsqamrILohFeK1PL
         hsM7/T1v8sr2Yt5URUzwWfZDmhAHtzHhYLMuya5VWeHrvRu4q8szlrEprD6Nxw4I7tE7
         SR1Zj0zdut4rg8/XzVFVItcnJmOwGdGQrzVu/4qWQ9TWY/TXlP4cDa1QQTpN2cCxxyhC
         J8FBqE31RLk1/+s6VTkyOB4eM751RzgzbbcoQj4LDzYCsY4bl3nRT86zkXTbj/ovv7AC
         iwBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702569873; x=1703174673;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=SSa6pGgyJKtkWWJBgToju2bl1vy3r2pnMsbZh5DB9Rw=;
        b=j6Y61ezapHHjsgzh9Ts+CU36o4scTpNBj4wWMohU8sjROVi6wUYhvExjPT6MRX0F48
         xTGp/Up7atcGGIAutkXEzpKhOKu3yO5Mq4Re4AcyIkvoGYRCEa9kXBhJr1q59o2cftEP
         IDlSsnkGNmSmzaoK2uIsSbD/bXTebdwF+Iwequ38pLa3fSRTsURslMxslib/Eegq+AxS
         X3N+P55nEFN/J1QHsgY/hj/TXgPJD/17d70bcM+EUXfGPHHuw509KJXoAVxCCw0PLe26
         RKTlpWHDjNh1pLU2jIBbEYUPexRKgzJ67LRQwQu7iIIMNvrQKvbntTBAoDvqnHHbZTSF
         cy5w==
X-Gm-Message-State: AOJu0Yx0BL1J2vvVC30GSUEcAOpmBdvi8799buFgZjHKGq/8T3lypQAm
	xLdmGhylEKQrfv15Y7mAYSryD8gV3M4bIAOUq5MsfQ==
X-Google-Smtp-Source: AGHT+IED5SZ6xGFBDrg9Ijyz3Cz25T5pnkTh7Y3J4D3Ph83X5TDhmg/CJcC0oYf+JFNsK+/1YOVcZ7tYE3fCt9RCCE8=
X-Received: by 2002:ad4:5906:0:b0:67e:af87:6d11 with SMTP id
 ez6-20020ad45906000000b0067eaf876d11mr10979067qvb.128.1702569873534; Thu, 14
 Dec 2023 08:04:33 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20231214105243.3707730-1-tudor.ambarus@linaro.org> <20231214105243.3707730-2-tudor.ambarus@linaro.org>
In-Reply-To: <20231214105243.3707730-2-tudor.ambarus@linaro.org>
From: Peter Griffin <peter.griffin@linaro.org>
Date: Thu, 14 Dec 2023 16:04:22 +0000
Message-ID: <CADrjBPr=j8sjG3gwRQBGjb7G+NQ6EDcxE+XixY6mT1rf06tyeA@mail.gmail.com>
Subject: Re: [PATCH 01/13] dt-bindings: clock: google,gs101: fix CMU_TOP gate
 clock names
To: Tudor Ambarus <tudor.ambarus@linaro.org>
Cc: robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org, 
	mturquette@baylibre.com, sboyd@kernel.org, conor+dt@kernel.org, 
	andi.shyti@kernel.org, alim.akhtar@samsung.com, gregkh@linuxfoundation.org, 
	jirislaby@kernel.org, catalin.marinas@arm.com, will@kernel.org, 
	s.nawrocki@samsung.com, tomasz.figa@gmail.com, cw00.choi@samsung.com, 
	arnd@arndb.de, semen.protsenko@linaro.org, andre.draszik@linaro.org, 
	saravanak@google.com, willmcvicker@google.com, 
	linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
	linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-i2c@vger.kernel.org, 
	linux-serial@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Tudor,

On Thu, 14 Dec 2023 at 10:52, Tudor Ambarus <tudor.ambarus@linaro.org> wrote:
>
> The gs101 clock names are derived from the clock register names under
> some certain rules. In particular, for the gate clocks the following is
> documented and expected in the gs101 clock driver:
>
>   Replace CLK_CON_GAT_CLKCMU      with CLK_GOUT_CMU and gout_cmu
>   Replace CLK_CON_GAT_GATE_CLKCMU with CLK_GOUT_CMU and gout_cmu
>
>   For gates remove _UID _BLK _IPCLKPORT and _RSTNSYNC
>
> The CMU TOP gate clock names missed to include the required "CMU"
> differentiator which will cause name collisions with the gate clock names
> of other clock units. Fix the TOP gate clock names and include "CMU" in
> their name.
>
> Fixes: 0a910f160638 ("dt-bindings: clock: Add Google gs101 clock management unit bindings")
> Signed-off-by: Tudor Ambarus <tudor.ambarus@linaro.org>

[...]

Thanks for spotting this inconsistency on the cmu_top gates and fixing it!

Reviewed-by: Peter Griffin <peter.griffin@linaro.org>
