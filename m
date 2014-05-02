From: Tushar Behera <tushar.behera@linaro.org>
Subject: Re: [PATCH V2] ASoC: SAMSUNG: Add sound card driver for Snow board
Date: Fri, 02 May 2014 10:26:08 +0530
Message-ID: <53632568.5020200@linaro.org>
References: <1398243705-31151-1-git-send-email-tushar.behera@linaro.org> <20140424133920.GA12304@sirena.org.uk> <5359E18B.60600@linaro.org> <20140429222915.GU15125@sirena.org.uk> <5360E5E7.8090807@linaro.org> <20140430180314.GA3245@sirena.org.uk> <53623004.5010805@linaro.org> <20140501141510.GW3245@sirena.org.uk> <CAD=FV=Wa4CovkxBng0SkUUAryiFqa=m63tro1Yv1jRgp4e95aw@mail.gmail.com> <20140501164003.GC3245@sirena.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20140501164003.GC3245@sirena.org.uk>
Sender: linux-kernel-owner@vger.kernel.org
To: Mark Brown <broonie@kernel.org>, Doug Anderson <dianders@chromium.org>
Cc: alsa-devel@alsa-project.org, linux-samsung-soc <linux-samsung-soc@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, linux-doc@vger.kernel.org, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Liam Girdwood <lgirdwood@gmail.com>, Rob Herring <robh+dt@kernel.org>, sbkim73@samsung.com, Randy Dunlap <rdunlap@infradead.org>, Mike Turquette <mturquette@linaro.org>
List-Id: linux-samsung-soc@vger.kernel.org

On 05/01/2014 10:10 PM, Mark Brown wrote:
> On Thu, May 01, 2014 at 08:54:14AM -0700, Doug Anderson wrote:
> 
>> This is exactly the thing (expected clock parenting) we agreed could
>> be put in the device tree I think.  ...but I don't know that anyone
>> proposed exactly how that would work.
> 
> There's patches been posted by (IIRC) Sylvester Nawrocki for this which
> I think Mike was basically happy with - I don't immediately see them in
> -next though, but I may be looking in the wrong place.
> 

Right, there are some patches from Sylwester regarding this. I dont'
think the patches are accepted yet as Rob has some reservations against
the clock parents.

https://lkml.org/lkml/2014/4/9/173

-- 
Tushar Behera
