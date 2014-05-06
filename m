From: Anton Vorontsov <anton@enomsg.org>
Subject: Re: [RESEND PATCH v3 2/5] charger: tps65090: Allow charger module to
 be used when no irq
Date: Mon, 5 May 2014 22:11:34 -0700
Message-ID: <20140506051133.GA30179@teo>
References: <1398268565-4789-3-git-send-email-dianders@chromium.org>
 <CAD=FV=W=Ffye5wp0PhJ2uX4jhEQkTKA4VTT4LyX2ZdByfE4UaQ@mail.gmail.com>
 <CAOesGMi+jH7xEzVxRX5qEoVycdtJ=FXOJRp1xut+65d4X8YFYA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <CAOesGMi+jH7xEzVxRX5qEoVycdtJ=FXOJRp1xut+65d4X8YFYA@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Olof Johansson <olof@lixom.net>
Cc: Doug Anderson <dianders@chromium.org>, Sachin Kamat <sachin.kamat@linaro.org>, AJAY KUMAR RAMAKRISHNA SHYMALAMMA <ajaykumar.rs@samsung.com>, linux-samsung-soc <linux-samsung-soc@vger.kernel.org>, "broonie@kernel.org" <broonie@kernel.org>, Lee Jones <lee.jones@linaro.org>, Dmitry Eremin-Solenikov <dbaryshkov@gmail.com>, David Woodhouse <dwmw2@infradead.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: linux-samsung-soc@vger.kernel.org

On Mon, May 05, 2014 at 09:51:28AM -0700, Olof Johansson wrote:
> > All the rest of this series has been acked and applied.  Do you have
> > time to review this patch?
> >
> > Thanks!  :)
> 
> FWIW, I've seen very little email traffic from Anton this year, he
> might have limited time for maintainership at the moment.

Yup.

commit 573189354b7c97cd2256b87cf083ee435584594e
Author: Dmitry Eremin-Solenikov <dbaryshkov@gmail.com>
Date:   Tue Jan 21 03:33:09 2014 +0400

    MAINTAINERS: Pick up power supply maintainership
    
    Anton stated that he would have to abandon power supply maintainership
    due to the lack of time. By agreement with him and David, pick up power
    supply tree.
    
    Signed-off-by: Dmitry Eremin-Solenikov <dbaryshkov@gmail.com>
    Acked-by: Anton Vorontsov <anton@enomsg.org>
