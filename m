Received: from mail-oa2-f15.google.com (mail-oa2-f15.google.com [74.125.231.79])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 94C81547066
	for <linux-samsung-soc@vger.kernel.org>; Sat, 19 Sep 2026 18:32:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.231.79
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789842778; cv=pass; b=js2FF4Usav5WvCR/obAFQGaGlPdT+f/F6vxnD5nBDw9gJEBlmMPSBgn2tpk8dztWLFApPRBYIG2i9aNOFcg0PIyZtSWpbyA/yJ4XWekigLaFwh7FiAsQ6Ar62eETh7SFFsuvKdo+GfAm5hamGR2j5rT6NpsVkwiLS/aDC68Ft/E=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789842778; c=relaxed/simple;
	bh=v97cycUBS4MKTJ2yqY/Dn1GyeLdtatYT3OAwk/a3bTw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Lh7Y/fd/ZyuR/LP1Uneb8427G4EJezeF4cn58ElYGf5AUu2p8my4h6dTjkCkXOi9dJi45/trPnN/oP/LR8P2qK2Yh/oCxakQGqNV1qo8n81MO8B+fPug40vJPQrTEDo8zXr8wPpFKbqn5ZgqUszxOX3mP6wvi59CeKG/o8EXFn4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jG6/NxRU; arc=pass smtp.client-ip=74.125.231.79
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jG6/NxRU"
Received: by mail-oa2-f15.google.com with SMTP id 586e51a60fabf-478cbd5b48aso1282017fac.2
        for <linux-samsung-soc@vger.kernel.org>; Sat, 19 Sep 2026 11:32:56 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789842775; cv=none;
        d=google.com; s=arc-20260327;
        b=HJorRoFXihMcYGiMnNhaF47UB2BC6owb/NxgEpDMtoSeivTxsdHSORztNtlQTXJGkg
         VMu09q+f8Sr/gjkLavHVrYju/JF4/HqvuQqGGMw73fJSBEt1I31DB/7zRWHngRzKEJpz
         GcJhgtzH2tvj5jk0BZ83hfeS4QfbCiSwaxv71OZ9ylclNzbiii6QStdKWiCvcTrAhyW9
         y3hx8hFgDYW86tUaAyYJtKf5ixD1mQUXDzBdw22qPMbz/AtcSvcWmBESKGLG6ryEm2NE
         hF+s1h549t1xVRg/ksgduOoumTzN2Do1M2QuCD7n984aHU5L+6SNh0CE3PRAbxmTBl6V
         27yg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Lx22JAqx3HdqfLp4etPkKWCHezogZYIQRxdcXNcbJpY=;
        fh=dAWRseE7i++sBVqLtJqaOr7HLMtrnr3Z2BVku8CyM34=;
        b=jzY150Vqc+2AkGAfLiDk5uyvIPyum0GDSpeXhy8q8PXg3qLnooEOoD95JE8kMsy6Gj
         8hSHxmh7gcokc/1KGiPoIV1fN2OLz4sqO6gvq727LCz7WN8K4suwpqADRg6lFXOtEn1F
         mEOkn1MEUbPtNT4zxUMDlnLvgOQFZXJnqu0wv0J2yI2uGYEvhi/x55+x2bYmQpIvVHka
         wMLTN0v+bMXH8qKnKkzFMxkIq/nLFqc5tMg1O4brZDPwm+AMJ6pe3pR/whCJR8MkQ1kI
         9DS8js9xfLoCN0x214l2CbQ9Ls3flaC1y5RjqpzUGNqECmKBw2A+B+V5G3nFaq3ejIfD
         Kajg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789842775; x=1790447575; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Lx22JAqx3HdqfLp4etPkKWCHezogZYIQRxdcXNcbJpY=;
        b=jG6/NxRUEH+HfJEzqlzXohwN6ckR/v2m/rSc9kz/dO5GsFaqphzAtFkIfEXFC5grbI
         7JXaiMlLEP8xqbV7uMAnQlN8ahH8OZ1TQCs/5JL7hQkca7wW4ga2y9W1yzuA59JLwGas
         ZIC7uRQg+9dt0wZUzDJ3dEBfiSjVYb9+wWSxHFkxnFWdI19II8iyorjDrDtcWfhyrEus
         cpAtGKsaLwSLu6NrVJrF9POINbYSWO5I8VHeRZ2pQW86pdR3qXTrZ1C3rTjRxOuXZ+Ua
         7Q3Lu2XEINXb/YbwTsjFGqAbDUsyRNb/XDj1ux33Q7fyL9RFRf4ws+604yCR8xqSlmYO
         Lttw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789842775; x=1790447575;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Lx22JAqx3HdqfLp4etPkKWCHezogZYIQRxdcXNcbJpY=;
        b=mACtLNMHV9anR39/STrIRb5iz93RfjMoBlzIo/Ltls2AogL3TZepuGd/GprcXuJ6fQ
         ZGdtVoIpzngoCfoEpF6IEpAwXc0B66yg9IZ1PXOzXC1cWOp2U958ul/qtlTG6oWPHKQL
         sF3B9aRvNiAFw82IAVdWpTe8Km6oQZrbs8sk8IBJqSdbUrBGy7lBqpU44DLToyy4JejE
         1xxin1iy5jIoWMS60EOGmtlnkNJcljVYFlgdhW2CuBhG7cIHKGGy0HC2dDeMOIUAvX5R
         M0R132sBZ67HPHm8wnSww7pYEXkHOL/UmEg88bgeUU7rhJrrxqku9rfaVAuPc3KT1UQo
         apnA==
X-Forwarded-Encrypted: i=1; AKwUvBytdfW9zOtnnerUqbeVcVulZp6F+z1g5k+xyCXO+Ko9ak4Z3cAvXAEta2upUNEv8A5gMD1kGRAGGU3YriugAAsC6w==@vger.kernel.org
X-Gm-Message-State: AFuF++nYRlpO4CTHaMtg2i+NOs5Wvum1sWkAY8Q9c0sFhI/8ItsIxJyJ
	Ckjcva8fVe22uHSL2okSwJyHOMxvlHAzphbonGnlflkUADkg0DsTFyl+QmRSN0tBPTNjkoVxTg/
	Hb+pfpi5HK6AMqtuieK1gohk1SuSo4ic=
X-Gm-Gg: AYBFou1Q0iLOBLwotbGr/3+VChstbu0tEaJB3mNafNtJFbWZLmBbEozoYirXiAHYVoa
	bLZhnJJKBbnHCJs8TjbtUKxscpTv8d7WNwahkvtvGXkIbbjUaGoIe32p+XOu3JyFRBm+sWGMyPr
	id8mTRVjptdgfRhaiSuABbnDzfXrHJ2VMXrPLNxTZEc1w5P/fSkhMkxUryep49cP8Kmpdbt1YZ9
	90K6+EErh5lnhAuxUozsGPTQUJiAxsP0My9JvLAjM0ESfTwgyxmiPmE494meWIvbO/hNGgKXaC2
	8lxD6kF/CKOqVkIV8gFXyaWfHhtvDURQ2aFFYTBqSH58Ek4ZYSNRz68=
X-Received: by 2002:a05:6870:8a0f:b0:45e:d660:b87 with SMTP id
 586e51a60fabf-486e5134a5amr5951125fac.9.1789842775310; Sat, 19 Sep 2026
 11:32:55 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260714222338.2965707-1-dianders@chromium.org>
 <20260714152138.7.I5cef580a62c86ba6c3465ad336fa509afbdf1476@changeid>
 <CABb+yY3_xBvQVFHEs=v39u7+TLjJRaVv3sg5pGgd0YxCruZ8Tw@mail.gmail.com>
 <CAD=FV=X-fAJp=EG_yTAg+QQgNYRCt25947oHGHZuq-FEyirK0g@mail.gmail.com>
 <CABb+yY2CH5A1ixfX9czgtEwsP95FN-2JVzN_wmRDRNsSuZY5PQ@mail.gmail.com> <CAD=FV=XiguzS7nH1sE=BkXt+7G6-hhqyz5u3sjc4zAA9H7KqJg@mail.gmail.com>
In-Reply-To: <CAD=FV=XiguzS7nH1sE=BkXt+7G6-hhqyz5u3sjc4zAA9H7KqJg@mail.gmail.com>
From: Jassi Brar <jassisinghbrar@gmail.com>
Date: Sat, 19 Sep 2026 13:32:44 -0500
X-Gm-Features: AcwNN1UwvAj9Edbq3yWCycTjTBcB7wt1MSsw00_ytosOZYg4EL85_GmD974H8ho
Message-ID: <CABb+yY2_AvcnaTDmpL8gP4H2_Pp3HddrtNr5gvL4GCW2DPPvOw@mail.gmail.com>
Subject: Re: [PATCH 7/7] mailbox: goog-mba: Introduce the goog-mba mailbox driver
To: Doug Anderson <dianders@chromium.org>
Cc: Joonwon Kang <joonwonkang@google.com>, Subhash Jadavani <sjadavani@google.com>, 
	Tudor Ambarus <tudor.ambarus@linaro.org>, Lucas Wei <lucaswei@google.com>, 
	Brian Norris <briannorris@chromium.org>, Peter Griffin <peter.griffin@linaro.org>, 
	=?UTF-8?Q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-samsung-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 9, 2026 at 11:57=E2=80=AFAM Doug Anderson <dianders@chromium.or=
g> wrote:
>
> > I am suggesting to consider TX-Is-Done when send_data() returns, i.e
> > tx submitted is seen as transferred. You anyway  don't catch
> > transmission errors. That way you fill all slots without blocking on
> > the first message and achieve this same throughput.
> > Without knowing the clients I am not sure if that can't be done.
>
> We need to know the txdone and thus we can't do what you're proposing.
> In general, queuing mailboxes are used in cases where the remote side
> enables a resource like a clock or power domain. Different tasks in
> the system may independently turn on/off these resources, so allowing
> them to work "in parallel" makes sense
>
It will still work in parallel - you still keep writing to the h/w
fifo without waiting for previous ones to finish as long as there is
space. Just like you get here.

. ...but each task needs to know
> for sure when its resource is finished turning on. If we just imagine
> 3 clocks we want to turn on.
>
> clk_enable(clk_a)
> clk_enable(clk_b)
> clk_enable(clk_c)
>
> Those 3 calls can be made in 3 different contexts from 3 different
> drivers. We want all 3 enables happening in parallel with each other
> (not one after another), but each call needs to know when its function
> is done.
>
I don't see why not?  The three requests will be queued into h/w fifo
in the order they arrive without any block - just as you do now.

Btw, if you mean they need to be enabled in parallel literally, they
should not be called from three different drivers. Instead they should
be modelled as one "composite" clock.

> Does that make sense?
>
The usage makes sense but I still don't see why existing api can't work.

Regards,
Jassi
