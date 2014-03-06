From: Sylwester Nawrocki <sylvester.nawrocki@gmail.com>
Subject: Re: [PATCH v6 01/10] Documentation: dt: Add binding documentation
 for S5K6A3 image sensor
Date: Thu, 06 Mar 2014 21:15:42 +0100
Message-ID: <5318D76E.80203@gmail.com>
References: <1394122819-9582-1-git-send-email-s.nawrocki@samsung.com> <1394122819-9582-2-git-send-email-s.nawrocki@samsung.com> <CA+gwMcc7sLp0N5oyCYf-121AzS8KsRdNsvY3DJ7p3z=yVLrBdw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-media-owner@vger.kernel.org>
In-Reply-To: <CA+gwMcc7sLp0N5oyCYf-121AzS8KsRdNsvY3DJ7p3z=yVLrBdw@mail.gmail.com>
Sender: linux-media-owner@vger.kernel.org
To: Philipp Zabel <philipp.zabel@gmail.com>
Cc: Sylwester Nawrocki <s.nawrocki@samsung.com>, linux-media@vger.kernel.org, devicetree@vger.kernel.org, Mark Rutland <mark.rutland@arm.com>, linux-samsung-soc@vger.kernel.org, a.hajda@samsung.com, kyungmin.park@samsung.com, Rob Herring <robh+dt@kernel.org>, Kumar Gala <galak@codeaurora.org>, Kukjin Kim <kgene.kim@samsung.com>, linux-arm-kernel <linux-arm-kernel@lists.infradead.org>
List-Id: linux-samsung-soc@vger.kernel.org

Hi Phillip,

On 03/06/2014 07:08 PM, Philipp Zabel wrote:
>> +++ b/Documentation/devicetree/bindings/media/samsung-s5k6a3.txt
>> >  @@ -0,0 +1,33 @@
>> >  +Samsung S5K6A3(YX) raw image sensor
>> >  +---------------------------------
>> >  +
>> >  +S5K6A3(YX) is a raw image sensor with MIPI CSI-2 and CCP2 image data interfaces
>> >  +and CCI (I2C compatible) control bus.
>> >  +
>> >  +Required properties:
>> >  +
>> >  +- compatible   : "samsung,s5k6a3";
>> >  +- reg          : I2C slave address of the sensor;
>> >  +- svdda-supply : core voltage supply;
>> >  +- svddio-supply        : I/O voltage supply;
>> >  +- afvdd-supply : AF (actuator) voltage supply;
>> >  +- gpios                : specifier of a GPIO connected to the RESET pin;
>
> Please use 'reset-gpios' for GPIOs connected to reset pins.

I would prefer to keep it as is, I'm not adding a new driver in this
series, just the binding documentation and doing some refactoring.
So if I changed this now, the driver would need to be messed up with
an additional code to support both 'gpios' and 'reset-gpios'. Are
there any serious reasons to use this specific name ? It's not
related to the reset signal DT bindings, is it ?

--
Regards,
Sylwester
