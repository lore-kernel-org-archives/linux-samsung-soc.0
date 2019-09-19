From: Sylwester Nawrocki <s.nawrocki@samsung.com>
Subject: Re: [PATCH v1 2/9] mfd: wm8994: Add support for MCLKn clock control
Date: Thu, 19 Sep 2019 14:48:56 +0200
Message-ID: <420d3c8a-a31e-1edf-3112-b9800beace1e@samsung.com>
References: <20190918104634.15216-1-s.nawrocki@samsung.com>
 <CGME20190918104656eucas1p1d9cad1394b08d05a99151c4fbc9425ce@eucas1p1.samsung.com>
 <20190918104634.15216-3-s.nawrocki@samsung.com> <20190919075924.GB13195@pi3>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20190919075924.GB13195@pi3>
Content-Language: en-GB
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org, linux-samsung-soc@vger.kernel.org, ckeepax@opensource.cirrus.com, b.zolnierkie@samsung.com, sbkim73@samsung.com, patches@opensource.cirrus.com, broonie@kernel.org, lgirdwood@gmail.com, robh+dt@kernel.org, linux-arm-kernel@lists.infradead.org, m.szyprowski@samsung.com
List-Id: linux-samsung-soc@vger.kernel.org

On 9/19/19 09:59, Krzysztof Kozlowski wrote:
> On Wed, Sep 18, 2019 at 12:46:27PM +0200, Sylwester Nawrocki wrote:
>> The WM1811/WM8994/WM8958 audio CODEC DT bindings specify two optional
>> clocks: "MCLK1", "MCLK2". Add code for getting those clocks in the MFD
>> part of the wm8994 driver so they can be further handled in the audio
>> CODEC part.
>
> I think these are needed only for the codec so how about getting them in
> codec's probe?

The clocks are specified in the (I2C slave device) DT node which corresponds
to the device as a whole and to which binds the MFD driver.  AFAICT those
clocks are only needed by the CODEC sub-driver but in general such clocks
could be used to provide device's system clock used by other functionalities 
than audio.  We are doing something similar for other MFD drivers already
and I would rather stick to one pattern. IMHO it's clearer to see what
device the clocks belong to that way.

-- 
Regards,
Sylwester
