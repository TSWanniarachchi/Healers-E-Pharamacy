<%@ Page Title="Healers Pharmacy Online Store" Language="C#" MasterPageFile="~/Pages/Shared/CustomerMaster.Master" AutoEventWireup="true" CodeBehind="Home.aspx.cs" Inherits="ECOMWebApp.Pages.Customer.Home" %>

<asp:Content ID="Content1" ContentPlaceHolderID="cphHead" runat="server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="cphForm" runat="server">

    <div class="ps-home ps-home--1">
        <section class="ps-section--banner">
            <div class="ps-section__overlay">
                <div class="ps-section__loading"></div>
            </div>
            <div class="owl-carousel" data-owl-auto="false" data-owl-loop="true" data-owl-speed="15000" data-owl-gap="0" data-owl-nav="true" data-owl-dots="true" data-owl-item="1" data-owl-item-xs="1" data-owl-item-sm="1" data-owl-item-md="1" data-owl-item-lg="1" data-owl-duration="1000" data-owl-mousedrag="on">
                <div class="ps-banner" style="background: #ffeb3b;">
                    <div class="container container-initial">
                        <div class="ps-banner__block">
                            <div class="ps-banner__content">
                                <h2 class="ps-banner__title">Appeton
                                    <br />
                                    Weight Gain</h2>
                                <div class="ps-banner__desc">Only in this month. Don’t misss!</div>
                                <div class="ps-banner__price">
                                    <span>LKR 5000.00</span>
                                    <del>LKR 5500.00</del>
                                </div>
                                <a class="bg-warning ps-banner__shop" href="Shop.aspx?id=15">Shop now</a>
                            </div>
                            <div class="ps-banner__thumnail">
                                <img class="ps-banner__round" src="../../Images/Customer/round2.png" alt="alt" /><img class="ps-banner__image" src="../../Images/Customer/promotion/slide18.png" alt="alt" />
                            </div>
                        </div>
                    </div>
                </div>
                <div class="ps-banner" style="background: #F0F2F5;">
                    <div class="container container-initial">
                        <div class="ps-banner__block">
                            <div class="ps-banner__content">
                                <h2 class="ps-banner__title">Antibacterial<br />
                                    Medical Mask</h2>
                                <div class="ps-banner__desc">Just a few seconds to measure your body temperature.</div>
                                <div class="ps-banner__btn-group">
                                    <div class="ps-banner__btn">
                                        <img src="../../Images/Customer/icon/bacterial.svg" alt="alt" />Anti-Bacterial
                                    </div>
                                    <div class="ps-banner__btn">
                                        <img src="../../Images/Customer/icon/virus.svg" alt="alt" />Anti-Virus
                                    </div>
                                </div>
                                <a class="bg-warning ps-banner__shop" href="Shop.aspx?id=32">Shop now</a>
                                <div class="ps-banner__persen bg-yellow ps-top"><small>only</small><small>LKR 20</small></div>
                            </div>
                            <div class="ps-banner__thumnail">
                                <img class="ps-banner__round" src="../../Images/Customer/round5.png" alt="alt" /><img class="ps-banner__image" src="../../Images/Customer/promotion/slide3.png" alt="alt" />
                            </div>
                        </div>
                    </div>
                </div>
                <div class="ps-banner" style="background: #c9c9c9;">
                    <div class="container container-initial">
                        <div class="ps-banner__block">
                            <div class="ps-banner__content">
                                <h2 class="ps-banner__title">For cleaner and
                                    <br />
                                    moisturized hands</h2>
                                <div class="ps-banner__desc">Get rid of all bacteria!</div>
                                <div class="ps-banner__btn-group">
                                    <div class="ps-banner__btn">
                                        <img src="../../Images/Customer/icon/bacterial.svg" alt="alt" />Anti-Bacterial
                                    </div>
                                    <div class="ps-banner__btn">
                                        <img src="../../Images/Customer/icon/virus.svg" alt="alt" />Anti-Virus
                                    </div>
                                </div>
                                <a class="bg-white ps-banner__shop" href="Shop.aspx?id=17">Shop now</a>
                                <%-- <div class="ps-banner__persen bg-primary">-25%</div>--%>
                            </div>
                            <div class="ps-banner__thumnail">
                                <img class="ps-banner__round" src="../../Images/Customer/round2.png" alt="alt" /><img class="ps-banner__image" src="../../Images/Customer/promotion/slide19.png" alt="alt" />
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>
        <br />
    </div>
    <div class="ps-home__content">
        <div class="container">
            <div class="ps-promo ps-not-padding">
                <div class="row">
                    <div class="col-12 col-md-4">
                        <div class="ps-promo__item">
                            <img class="ps-promo__banner" src="../../Images/Customer/products/New Product/bg-bannerNew5.jpg" alt="alt" />
                            <div class="ps-promo__content">
                                <span class="ps-promo__badge">New</span>
                                <h4 class="text-white ps-promo__name">Accu-Chek
                                        <br />
                                    Active
                                        <br />
                                    Blood
                                        <br />
                                    Glucose
                                        <br />
                                    Monitor</h4>
                                <a class="ps-promo__btn" href="Shop.aspx?id=18">More</a>
                            </div>
                        </div>
                    </div>
                    <div class="col-12 col-md-4">
                        <div class="ps-promo__item">
                            <img class="ps-promo__banner" src="../../Images/Customer/promotion/bg-banner10.jpg" alt="alt" />
                            <div class="ps-promo__content">
                                <h4 class="ps-promo__name">Velona  
                                        <br />
                                    Cuddles
                                        <br />
                                    Diaper
                                        <br />
                                    (30) Xl</h4>
                                <div class="ps-promo__sale">-10%</div>
                                <a class="ps-promo__btn" href="Shop.aspx?id=19">Shop now</a>
                            </div>
                        </div>
                    </div>
                    <div class="col-12 col-md-4">
                        <div class="ps-promo__item">
                            <img class="ps-promo__banner" src="../../Images/Customer/promotion/bg-banner11.jpg" alt="alt" />
                            <div class="ps-promo__content">
                                <h4 class="text-white ps-promo__name">Sustagen
                                        <br />
                                    Vanilla 400g</h4>
                                <div class="ps-promo__meta">
                                    <p class="ps-promo__price">LKR 2000.00</p>
                                    <p class="ps-promo__del">LKR 2200.00</p>
                                </div>
                                <a class="ps-promo__btn" href="Shop.aspx?id=20">Shop now</a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

            <section class="ps-section--latest">
                <div class="container">
                    <h3 class="ps-section__title">Latest products</h3>
                    <div class="ps-section__carousel">
                        <div class="owl-carousel" data-owl-auto="false" data-owl-loop="true" data-owl-speed="13000" data-owl-gap="0" data-owl-nav="true" data-owl-dots="true" data-owl-item="5" data-owl-item-xs="2" data-owl-item-sm="2" data-owl-item-md="3" data-owl-item-lg="5" data-owl-item-xl="5" data-owl-duration="1000" data-owl-mousedrag="on">
                            <div class="ps-section__product">
                                <div class="ps-product ps-product--standard">
                                    <div class="ps-product__thumbnail">
                                        <a class="ps-product__image" href="Shop.aspx?id=21">
                                            <figure>
                                                <img src="../../Images/Customer/products/New Product/1.jpg" alt="alt" /><img src="../../Images/Customer/products/New Product/1.1.jpg" alt="alt" />
                                            </figure>
                                        </a>

                                    </div>
                                    <div class="ps-product__content">
                                        <h5 class="ps-product__title"><a href="Shop.aspx?id=21">Indica Amla & Henna Natural Black Powder Hair Colour (Pack of 8, 8 x 5gm) (40gms)</a></h5>
                                        <div class="ps-product__meta">
                                            <span class="ps-product__price sale">LKR 2500.00</span><span class="ps-product__del">LKR 2850.00</span>
                                        </div>
                                        <div class="ps-product__rating">
                                            <select class="ps-rating" data-read-only="true">
                                                <option value="1">1</option>
                                                <option value="2">2</option>
                                                <option value="3">3</option>
                                                <option value="4">4</option>
                                                <option value="5" selected="selected">5</option>
                                            </select><span class="ps-product__review">( Reviews)</span>
                                        </div>
                                        <div class="ps-product__desc">
                                            <ul class="ps-product__list">
                                                <li>Study history up to 30 days</li>
                                                <li>Up to 5 users simultaneously</li>
                                                <li>Has HEALTH certificate</li>
                                            </ul>
                                        </div>
                                        <div class="ps-product__actions ps-product__group-mobile">
                                            <div class="ps-product__quantity">
                                                <div class="def-number-input number-input safari_only">
                                                    <button class="minus" onclick="this.parentNode.querySelector('input[type=number]').stepDown()"><i class="icon-minus"></i></button>
                                                    <input class="quantity" min="0" name="quantity" value="1" type="number" />
                                                    <button class="plus" onclick="this.parentNode.querySelector('input[type=number]').stepUp()"><i class="icon-plus"></i></button>
                                                </div>
                                            </div>

                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="ps-section__product">
                                <div class="ps-product ps-product--standard">
                                    <div class="ps-product__thumbnail">
                                        <a class="ps-product__image" href="Shop.aspx?id=22">
                                            <figure>
                                                <img src="../../Images/Customer/products/New Product/2.jpg" alt="alt" /><img src="../../Images/Customer/products/New Product/2.2.jpg" alt="alt" />
                                            </figure>
                                        </a>

                                        <div class="ps-product__badge">
                                        </div>
                                    </div>
                                    <div class="ps-product__content">
                                        <h5 class="ps-product__title"><a href="Shop.aspx?id=22">Emergen-C 1000mg Vitamin C Powder, with Antioxidants, B</a></h5>
                                        <div class="ps-product__meta">
                                            <span class="ps-product__price sale">LKR 1800.00</span><span class="ps-product__del">LKR 2100.00</span>
                                        </div>
                                        <div class="ps-product__rating">
                                            <select class="ps-rating" data-read-only="true">
                                                <option value="1">1</option>
                                                <option value="2">2</option>
                                                <option value="3">3</option>
                                                <option value="4">4</option>
                                                <option value="5" selected="selected">5</option>
                                            </select><span class="ps-product__review">( Reviews)</span>
                                        </div>
                                        <div class="ps-product__desc">
                                            <ul class="ps-product__list">
                                                <li>Study history up to 30 days</li>
                                                <li>Up to 5 users simultaneously</li>
                                                <li>Has HEALTH certificate</li>
                                            </ul>
                                        </div>
                                        <div class="ps-product__actions ps-product__group-mobile">
                                            <div class="ps-product__quantity">
                                                <div class="def-number-input number-input safari_only">
                                                    <button class="minus" onclick="this.parentNode.querySelector('input[type=number]').stepDown()"><i class="icon-minus"></i></button>
                                                    <input class="quantity" min="0" name="quantity" value="1" type="number" />
                                                    <button class="plus" onclick="this.parentNode.querySelector('input[type=number]').stepUp()"><i class="icon-plus"></i></button>
                                                </div>
                                            </div>

                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="ps-section__product">
                                <div class="ps-product ps-product--standard">
                                    <div class="ps-product__thumbnail">
                                        <a class="ps-product__image" href="Shop.aspx?id=23">
                                            <figure>
                                                <img src="../../Images/Customer/products/New Product/3.jpg" alt="alt" /><img src="../../Images/Customer/products/New Product/3.3.jpg" alt="alt" />
                                            </figure>
                                        </a>

                                        <div class="ps-product__badge">
                                            <div class="ps-badge ps-badge--hot">Hot</div>
                                        </div>
                                    </div>
                                    <div class="ps-product__content">
                                        <h5 class="ps-product__title"><a href="Shop.aspx?id=23">10 Pieces of wholesale KN95 Original 5 Layer Face Mask</a></h5>
                                        <div class="ps-product__meta">
                                            <span class="ps-product__price">LKR 1000.00</span>
                                        </div>
                                        <div class="ps-product__rating">
                                            <select class="ps-rating" data-read-only="true">
                                                <option value="1">1</option>
                                                <option value="2">2</option>
                                                <option value="3">3</option>
                                                <option value="4" selected="selected">4</option>
                                                <option value="5">5</option>
                                            </select><span class="ps-product__review">( Reviews)</span>
                                        </div>
                                        <div class="ps-product__desc">
                                            <ul class="ps-product__list">
                                                <li>Study history up to 30 days</li>
                                                <li>Up to 5 users simultaneously</li>
                                                <li>Has HEALTH certificate</li>
                                            </ul>
                                        </div>
                                        <div class="ps-product__actions ps-product__group-mobile">
                                            <div class="ps-product__quantity">
                                                <div class="def-number-input number-input safari_only">
                                                    <button class="minus" onclick="this.parentNode.querySelector('input[type=number]').stepDown()"><i class="icon-minus"></i></button>
                                                    <input class="quantity" min="0" name="quantity" value="1" type="number" />
                                                    <button class="plus" onclick="this.parentNode.querySelector('input[type=number]').stepUp()"><i class="icon-plus"></i></button>
                                                </div>
                                            </div>

                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="ps-section__product">
                                <div class="ps-product ps-product--standard">
                                    <div class="ps-product__thumbnail">
                                        <a class="ps-product__image" href="Shop.aspx?id=24">
                                            <figure>
                                                <img src="../../Images/Customer/products/New Product/4.jpg" alt="alt" /><img src="../../Images/Customer/products/New Product/4.4.jpg" alt="alt" />
                                            </figure>
                                        </a>

                                        <div class="ps-product__badge">
                                        </div>
                                    </div>
                                    <div class="ps-product__content">
                                        <h5 class="ps-product__title"><a href="Shop.aspx?id=24">Fingertio Pluse Oximeter</a></h5>
                                        <div class="ps-product__meta">
                                            <span class="ps-product__price">LKR 5900.00</span>
                                        </div>
                                        <div class="ps-product__rating">
                                            <select class="ps-rating" data-read-only="true">
                                                <option value="1">1</option>
                                                <option value="2">2</option>
                                                <option value="3">3</option>
                                                <option value="4">4</option>
                                                <option value="5" selected="selected">5</option>
                                            </select><span class="ps-product__review">( Reviews)</span>
                                        </div>
                                        <div class="ps-product__desc">
                                            <ul class="ps-product__list">
                                                <li>Study history up to 30 days</li>
                                                <li>Up to 5 users simultaneously</li>
                                                <li>Has HEALTH certificate</li>
                                            </ul>
                                        </div>
                                        <div class="ps-product__actions ps-product__group-mobile">
                                            <div class="ps-product__quantity">
                                                <div class="def-number-input number-input safari_only">
                                                    <button class="minus" onclick="this.parentNode.querySelector('input[type=number]').stepDown()"><i class="icon-minus"></i></button>
                                                    <input class="quantity" min="0" name="quantity" value="1" type="number" />
                                                    <button class="plus" onclick="this.parentNode.querySelector('input[type=number]').stepUp()"><i class="icon-plus"></i></button>
                                                </div>
                                            </div>

                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="ps-section__product">
                                <div class="ps-product ps-product--standard">
                                    <div class="ps-product__thumbnail">
                                        <a class="ps-product__image" href="Shop.aspx?id=25">
                                            <figure>
                                                <img src="../../Images/Customer/products/006.jpg" alt="alt" /><img src="../../Images/Customer/products/051.jpg" alt="alt" />
                                            </figure>
                                        </a>

                                        <div class="ps-product__badge">
                                            <div class="ps-badge ps-badge--sold">Sold Out</div>
                                        </div>
                                    </div>
                                    <div class="ps-product__content">
                                        <h5 class="ps-product__title"><a href="Shop.aspx?id=25">Anti-Dust Filter, Breathable, 3 Layers of Purifying Pack</a></h5>
                                        <div class="ps-product__meta">
                                            <span class="ps-product__price">LKR 450.00</span>
                                        </div>
                                        <div class="ps-product__rating">
                                            <select class="ps-rating" data-read-only="true">
                                                <option value="1">1</option>
                                                <option value="2">2</option>
                                                <option value="3">3</option>
                                                <option value="4">4</option>
                                                <option value="5" selected="selected">5</option>
                                            </select><span class="ps-product__review">( Reviews)</span>
                                        </div>
                                        <div class="ps-product__desc">
                                            <ul class="ps-product__list">
                                                <li>Study history up to 30 days</li>
                                                <li>Up to 5 users simultaneously</li>
                                                <li>Has HEALTH certificate</li>
                                            </ul>
                                        </div>
                                        <div class="ps-product__actions ps-product__group-mobile">
                                            <div class="ps-product__quantity">
                                                <div class="def-number-input number-input safari_only">
                                                    <button class="minus" onclick="this.parentNode.querySelector('input[type=number]').stepDown()"><i class="icon-minus"></i></button>
                                                    <input class="quantity" min="0" name="quantity" value="1" type="number" />
                                                    <button class="plus" onclick="this.parentNode.querySelector('input[type=number]').stepUp()"><i class="icon-plus"></i></button>
                                                </div>
                                            </div>

                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="ps-section__product">
                                <div class="ps-product ps-product--standard">
                                    <div class="ps-product__thumbnail">
                                        <a class="ps-product__image" href="Shop.aspx?id=26">
                                            <figure>
                                                <img src="../../Images/Customer/products/New Product/5.jpg" alt="alt" /><img src="../../Images/Customer/products/New Product/5.5.jpg" alt="alt" />
                                            </figure>
                                        </a>

                                        <div class="ps-product__badge">
                                        </div>
                                    </div>
                                    <div class="ps-product__content">
                                        <h5 class="ps-product__title"><a href="Shop.aspx?id=26">Piriton Tab 4mg 1000's</a></h5>
                                        <div class="ps-product__meta">
                                            <span class="ps-product__price">LKR 400.00</span>
                                        </div>
                                        <div class="ps-product__rating">
                                            <select class="ps-rating" data-read-only="true">
                                                <option value="1">1</option>
                                                <option value="2">2</option>
                                                <option value="3">3</option>
                                                <option value="4">4</option>
                                                <option value="5" selected="selected">5</option>
                                            </select><span class="ps-product__review">( Reviews)</span>
                                        </div>
                                        <div class="ps-product__desc">
                                            <ul class="ps-product__list">
                                                <li>Study history up to 30 days</li>
                                                <li>Up to 5 users simultaneously</li>
                                                <li>Has HEALTH certificate</li>
                                            </ul>
                                        </div>
                                        <div class="ps-product__actions ps-product__group-mobile">
                                            <div class="ps-product__quantity">
                                                <div class="def-number-input number-input safari_only">
                                                    <button class="minus" onclick="this.parentNode.querySelector('input[type=number]').stepDown()"><i class="icon-minus"></i></button>
                                                    <input class="quantity" min="0" name="quantity" value="1" type="number" />
                                                    <button class="plus" onclick="this.parentNode.querySelector('input[type=number]').stepUp()"><i class="icon-plus"></i></button>
                                                </div>
                                            </div>

                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="ps-section__product">
                                <div class="ps-product ps-product--standard">
                                    <div class="ps-product__thumbnail">
                                        <a class="ps-product__image" href="Shop.aspx?id=27">
                                            <figure>
                                                <img src="../../Images/Customer/products/New Product/6.jpg" alt="alt" /><img src="../../Images/Customer/products/New Product/6.6.jpg" alt="alt" />
                                            </figure>
                                        </a>


                                    </div>
                                    <div class="ps-product__content">
                                        <h5 class="ps-product__title"><a href="Shop.aspx?id=27">Maliban Milk Powder Vitagen Tin 400g</a></h5>
                                        <div class="ps-product__meta">
                                            <span class="ps-product__price sale">LKR 1600.00</span><span class="ps-product__del">LKR 1850.00</span>
                                        </div>
                                        <div class="ps-product__rating">
                                            <select class="ps-rating" data-read-only="true">
                                                <option value="1">1</option>
                                                <option value="2">2</option>
                                                <option value="3">3</option>
                                                <option value="4">4</option>
                                                <option value="5" selected="selected">5</option>
                                            </select><span class="ps-product__review">( Reviews)</span>
                                        </div>
                                        <div class="ps-product__desc">
                                            <ul class="ps-product__list">
                                                <li>Study history up to 30 days</li>
                                                <li>Up to 5 users simultaneously</li>
                                                <li>Has HEALTH certificate</li>
                                            </ul>
                                        </div>
                                        <div class="ps-product__actions ps-product__group-mobile">
                                            <div class="ps-product__quantity">
                                                <div class="def-number-input number-input safari_only">
                                                    <button class="minus" onclick="this.parentNode.querySelector('input[type=number]').stepDown()"><i class="icon-minus"></i></button>
                                                    <input class="quantity" min="0" name="quantity" value="1" type="number" />
                                                    <button class="plus" onclick="this.parentNode.querySelector('input[type=number]').stepUp()"><i class="icon-plus"></i></button>
                                                </div>
                                            </div>

                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="ps-section__product">
                                <div class="ps-product ps-product--standard">
                                    <div class="ps-product__thumbnail">
                                        <a class="ps-product__image" href="Shop.aspx?id=28">
                                            <figure>
                                                <img src="../../Images/Customer/products/001.jpg" alt="alt" /><img src="../../Images/Customer/products/009.jpg" alt="alt" />
                                            </figure>
                                        </a>

                                        <div class="ps-product__badge">
                                        </div>
                                    </div>
                                    <div class="ps-product__content">
                                        <h5 class="ps-product__title"><a href="Shop.aspx?id=28">Digital Thermometer X30-Pro</a></h5>
                                        <div class="ps-product__meta">
                                            <span class="ps-product__price">LKR 4500.00</span>
                                        </div>
                                        <div class="ps-product__rating">
                                            <select class="ps-rating" data-read-only="true">
                                                <option value="1">1</option>
                                                <option value="2">2</option>
                                                <option value="3">3</option>
                                                <option value="4">4</option>
                                                <option value="5" selected="selected">5</option>
                                            </select><span class="ps-product__review">( Reviews)</span>
                                        </div>
                                        <div class="ps-product__desc">
                                            <ul class="ps-product__list">
                                                <li>Study history up to 30 days</li>
                                                <li>Up to 5 users simultaneously</li>
                                                <li>Has HEALTH certificate</li>
                                            </ul>
                                        </div>
                                        <div class="ps-product__actions ps-product__group-mobile">
                                            <div class="ps-product__quantity">
                                                <div class="def-number-input number-input safari_only">
                                                    <button class="minus" onclick="this.parentNode.querySelector('input[type=number]').stepDown()"><i class="icon-minus"></i></button>
                                                    <input class="quantity" min="0" name="quantity" value="1" type="number" />
                                                    <button class="plus" onclick="this.parentNode.querySelector('input[type=number]').stepUp()"><i class="icon-plus"></i></button>
                                                </div>
                                            </div>

                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="ps-section__product">
                                <div class="ps-product ps-product--standard">
                                    <div class="ps-product__thumbnail">
                                        <a class="ps-product__image" href="Shop.aspx?id=29">
                                            <figure>
                                                <img src="../../Images/Customer/products/New Product/9.jpg" alt="alt" /><img src="../../Images/Customer/products/New Product/9.9.jpg" alt="alt" />
                                            </figure>
                                        </a>

                                        <div class="ps-product__badge">
                                            <div class="ps-badge ps-badge--hot">Hot</div>
                                        </div>
                                    </div>
                                    <div class="ps-product__content">
                                        <h5 class="ps-product__title"><a href="Shop.aspx?id=29">Digene Gel Syrup - 200 ml</a></h5>
                                        <div class="ps-product__meta">
                                            <span class="ps-product__price">LKR 250.00</span>
                                        </div>
                                        <div class="ps-product__rating">
                                            <select class="ps-rating" data-read-only="true">
                                                <option value="1">1</option>
                                                <option value="2">2</option>
                                                <option value="3">3</option>
                                                <option value="4" selected="selected">4</option>
                                                <option value="5">5</option>
                                            </select><span class="ps-product__review">( Reviews)</span>
                                        </div>
                                        <div class="ps-product__desc">
                                            <ul class="ps-product__list">
                                                <li>Study history up to 30 days</li>
                                                <li>Up to 5 users simultaneously</li>
                                                <li>Has HEALTH certificate</li>
                                            </ul>
                                        </div>
                                        <div class="ps-product__actions ps-product__group-mobile">
                                            <div class="ps-product__quantity">
                                                <div class="def-number-input number-input safari_only">
                                                    <button class="minus" onclick="this.parentNode.querySelector('input[type=number]').stepDown()"><i class="icon-minus"></i></button>
                                                    <input class="quantity" min="0" name="quantity" value="1" type="number" />
                                                    <button class="plus" onclick="this.parentNode.querySelector('input[type=number]').stepUp()"><i class="icon-plus"></i></button>
                                                </div>
                                            </div>

                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </section>
            <div class="container">
                <div class="ps-delivery" data-background="img/promotion/banner-delivery-2.jpg">
                    <div class="ps-delivery__content">
                        <div class="ps-delivery__text"><i class="icon-shield-check"></i><span><strong>100% Secure delivery </strong>without contacting the courier</span></div>
                        <a class="ps-delivery__more" href="Shop.aspx">More</a>
                    </div>
                </div>
                <section class="ps-section--deals">
                    <div class="ps-section__header">
                        <h3 class="ps-section__title">Best Deals of the week!</h3>
                        <div class="ps-countdown">
                            <div class="ps-countdown__content">
                                <div class="ps-countdown__block ps-countdown__days">
                                    <div class="ps-countdown__number"><span class="first-1st">0</span><span class="first">0</span><span class="last">0</span></div>
                                    <div class="ps-countdown__ref">Days</div>
                                </div>
                                <div class="ps-countdown__block ps-countdown__hours">
                                    <div class="ps-countdown__number"><span class="first">0</span><span class="last">0</span></div>
                                    <div class="ps-countdown__ref">Hours</div>
                                </div>
                                <div class="ps-countdown__block ps-countdown__minutes">
                                    <div class="ps-countdown__number"><span class="first">0</span><span class="last">0</span></div>
                                    <div class="ps-countdown__ref">Mins</div>
                                </div>
                                <div class="ps-countdown__block ps-countdown__seconds">
                                    <div class="ps-countdown__number"><span class="first">0</span><span class="last">0</span></div>
                                    <div class="ps-countdown__ref">Secs </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="ps-section__carousel">
                        <div class="owl-carousel" data-owl-auto="false" data-owl-loop="true" data-owl-speed="13000" data-owl-gap="0" data-owl-nav="true" data-owl-dots="true" data-owl-item="5" data-owl-item-xs="2" data-owl-item-sm="2" data-owl-item-md="3" data-owl-item-lg="5" data-owl-item-xl="5" data-owl-duration="1000" data-owl-mousedrag="on">
                            <div class="ps-section__product">
                                <div class="ps-product ps-product--standard">
                                    <div class="ps-product__thumbnail">
                                        <a class="ps-product__image" href="Shop.aspx?id=30">
                                            <figure>
                                                <img src="../../Images/Customer/products/New Product/8.jpg" alt="alt" /><img src="../../Images/Customer/products/New Product/8.8.jpg" alt="alt" />
                                            </figure>
                                        </a>


                                        <div class="ps-product__percent">-10%</div>
                                    </div>
                                    <div class="ps-product__content">
                                        <h5 class="ps-product__title"><a href="Shop.aspx?id=30">Ervamatin Hair Lotion 200 ml</a></h5>
                                        <div class="ps-product__meta">
                                            <span class="ps-product__price sale">LKR 3800.00</span><span class="ps-product__del">LKR 4000.00</span>
                                        </div>
                                        <div class="ps-product__rating">
                                            <select class="ps-rating" data-read-only="true">
                                                <option value="1">1</option>
                                                <option value="2">2</option>
                                                <option value="3">3</option>
                                                <option value="4">4</option>
                                                <option value="5" selected="selected">5</option>
                                            </select><span class="ps-product__review">( Reviews)</span>
                                        </div>

                                        <div class="ps-product__desc">
                                            <ul class="ps-product__list">
                                                <li>Study history up to 30 days</li>
                                                <li>Up to 5 users simultaneously</li>
                                                <li>Has HEALTH certificate</li>
                                            </ul>
                                        </div>
                                        <div class="ps-product__actions ps-product__group-mobile">
                                            <div class="ps-product__quantity">
                                                <div class="def-number-input number-input safari_only">
                                                    <button class="minus" onclick="this.parentNode.querySelector('input[type=number]').stepDown()"><i class="icon-minus"></i></button>
                                                    <input class="quantity" min="0" name="quantity" value="1" type="number" />
                                                    <button class="plus" onclick="this.parentNode.querySelector('input[type=number]').stepUp()"><i class="icon-plus"></i></button>
                                                </div>
                                            </div>

                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="ps-section__product">
                                <div class="ps-product ps-product--standard">
                                    <div class="ps-product__thumbnail">
                                        <a class="ps-product__image" href="Shop.aspx?id=31">
                                            <figure>
                                                <img src="../../Images/Customer/products/New Product/3.jpg" alt="alt" /><img src="../../Images/Customer/products/New Product/3.3.jpg" alt="alt" />
                                            </figure>
                                        </a>

                                        <div class="ps-product__badge">
                                        </div>

                                    </div>
                                    <div class="ps-product__content">
                                        <h5 class="ps-product__title"><a href="Shop.aspx?id=31">KN95 Original 5 Layer Face Mask</a></h5>
                                        <div class="ps-product__meta">
                                            <span class="ps-product__price sale">LKR 80.00</span><span class="ps-product__del">LKR 100.00</span>
                                        </div>
                                        <div class="ps-product__rating">
                                            <select class="ps-rating" data-read-only="true">
                                                <option value="1">1</option>
                                                <option value="2">2</option>
                                                <option value="3">3</option>
                                                <option value="4">4</option>
                                                <option value="5">5</option>
                                            </select><span class="ps-product__review">( Reviews)</span>
                                        </div>

                                        <div class="ps-product__desc">
                                            <ul class="ps-product__list">
                                                <li>Study history up to 30 days</li>
                                                <li>Up to 5 users simultaneously</li>
                                                <li>Has HEALTH certificate</li>
                                            </ul>
                                        </div>
                                        <div class="ps-product__actions ps-product__group-mobile">
                                            <div class="ps-product__quantity">
                                                <div class="def-number-input number-input safari_only">
                                                    <button class="minus" onclick="this.parentNode.querySelector('input[type=number]').stepDown()"><i class="icon-minus"></i></button>
                                                    <input class="quantity" min="0" name="quantity" value="1" type="number" />
                                                    <button class="plus" onclick="this.parentNode.querySelector('input[type=number]').stepUp()"><i class="icon-plus"></i></button>
                                                </div>
                                            </div>

                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="ps-section__product">
                                <div class="ps-product ps-product--standard">
                                    <div class="ps-product__thumbnail">
                                        <a class="ps-product__image" href="Shop.aspx?id=32">
                                            <figure>
                                                <img src="../../Images/Customer/products/050.jpg" alt="alt" /><img src="../../Images/Customer/products/052.jpg" alt="alt" />
                                            </figure>
                                        </a>

                                        <div class="ps-product__badge">
                                        </div>

                                    </div>
                                    <div class="ps-product__content">
                                        <h5 class="ps-product__title"><a href="Shop.aspx?id=32">Disposable Face Mask for Unisex</a></h5>
                                        <div class="ps-product__meta">
                                            <span class="ps-product__price sale">LKR 20.00</span><span class="ps-product__del">LKR 30.00</span>
                                        </div>
                                        <div class="ps-product__rating">
                                            <select class="ps-rating" data-read-only="true">
                                                <option value="1">1</option>
                                                <option value="2">2</option>
                                                <option value="3">3</option>
                                                <option value="4">4</option>
                                                <option value="5" selected="selected">5</option>
                                            </select><span class="ps-product__review">( Reviews)</span>
                                        </div>

                                        <div class="ps-product__desc">
                                            <ul class="ps-product__list">
                                                <li>Study history up to 30 days</li>
                                                <li>Up to 5 users simultaneously</li>
                                                <li>Has HEALTH certificate</li>
                                            </ul>
                                        </div>
                                        <div class="ps-product__actions ps-product__group-mobile">
                                            <div class="ps-product__quantity">
                                                <div class="def-number-input number-input safari_only">
                                                    <button class="minus" onclick="this.parentNode.querySelector('input[type=number]').stepDown()"><i class="icon-minus"></i></button>
                                                    <input class="quantity" min="0" name="quantity" value="1" type="number" />
                                                    <button class="plus" onclick="this.parentNode.querySelector('input[type=number]').stepUp()"><i class="icon-plus"></i></button>
                                                </div>
                                            </div>

                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="ps-section__product">
                                <div class="ps-product ps-product--standard">
                                    <div class="ps-product__thumbnail">
                                        <a class="ps-product__image" href="Shop.aspx?id=33">
                                            <figure>
                                                <img src="../../Images/Customer/products/New Product/10.jpg" alt="alt" /><img src="../../Images/Customer/products/New Product/10.10.jpg" alt="alt" />
                                            </figure>
                                        </a>

                                        <div class="ps-product__badge">
                                        </div>
                                        <div class="ps-product__percent">-5%</div>
                                    </div>
                                    <div class="ps-product__content">
                                        <h5 class="ps-product__title"><a href="Shop.aspx?id=33">NNO Nourishing Night-Oil</a></h5>
                                        <div class="ps-product__meta">
                                            <span class="ps-product__price sale">LKR 1200.00</span><span class="ps-product__del">LKR 1350.00</span>
                                        </div>
                                        <div class="ps-product__rating">
                                            <select class="ps-rating" data-read-only="true">
                                                <option value="1">1</option>
                                                <option value="2">2</option>
                                                <option value="3">3</option>
                                                <option value="4">4</option>
                                                <option value="5" selected="selected">5</option>
                                            </select><span class="ps-product__review">( Reviews)</span>
                                        </div>

                                        <div class="ps-product__desc">
                                            <ul class="ps-product__list">
                                                <li>Study history up to 30 days</li>
                                                <li>Up to 5 users simultaneously</li>
                                                <li>Has HEALTH certificate</li>
                                            </ul>
                                        </div>
                                        <div class="ps-product__actions ps-product__group-mobile">
                                            <div class="ps-product__quantity">
                                                <div class="def-number-input number-input safari_only">
                                                    <button class="minus" onclick="this.parentNode.querySelector('input[type=number]').stepDown()"><i class="icon-minus"></i></button>
                                                    <input class="quantity" min="0" name="quantity" value="1" type="number" />
                                                    <button class="plus" onclick="this.parentNode.querySelector('input[type=number]').stepUp()"><i class="icon-plus"></i></button>
                                                </div>
                                            </div>

                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="ps-section__product">
                                <div class="ps-product ps-product--standard">
                                    <div class="ps-product__thumbnail">
                                        <a class="ps-product__image" href="Shop.aspx?id=34">
                                            <figure>
                                                <img src="../../Images/Customer/products/New Product/11.11.jpg" alt="alt" /><img src="../../Images/Customer/products/New Product/11.jpg" alt="alt" />
                                            </figure>
                                        </a>

                                        <div class="ps-product__badge">
                                        </div>
                                    </div>
                                    <div class="ps-product__content">
                                        <h5 class="ps-product__title"><a href="Shop.aspx?id=34">Facia Gold Applicap - 3x10's</a></h5>
                                        <div class="ps-product__meta">
                                            <span class="ps-product__price sale">LKR 1000.00</span><span class="ps-product__del">LKR 1200.00</span>
                                        </div>
                                        <div class="ps-product__rating">
                                            <select class="ps-rating" data-read-only="true">
                                                <option value="1">1</option>
                                                <option value="2" selected="selected">2</option>
                                                <option value="3">3</option>
                                                <option value="4">4</option>
                                                <option value="5">5</option>
                                            </select><span class="ps-product__review">( Reviews)</span>
                                        </div>

                                        <div class="ps-product__desc">
                                            <ul class="ps-product__list">
                                                <li>Study history up to 30 days</li>
                                                <li>Up to 5 users simultaneously</li>
                                                <li>Has HEALTH certificate</li>
                                            </ul>
                                        </div>
                                        <div class="ps-product__actions ps-product__group-mobile">
                                            <div class="ps-product__quantity">
                                                <div class="def-number-input number-input safari_only">
                                                    <button class="minus" onclick="this.parentNode.querySelector('input[type=number]').stepDown()"><i class="icon-minus"></i></button>
                                                    <input class="quantity" min="0" name="quantity" value="1" type="number" />
                                                    <button class="plus" onclick="this.parentNode.querySelector('input[type=number]').stepUp()"><i class="icon-plus"></i></button>
                                                </div>
                                            </div>

                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </section>
                <section class="ps-section--sellers">
                    <h3 class="ps-section__title">Top 5 Bestsellers in: </h3>
                    <div class="ps-section__tab">
                        <ul class="nav nav-tabs" id="bestsellerTab" role="tablist">
                            <li class="nav-item" role="presentation"><a class="nav-link active" id="blood-tab" data-toggle="tab" href="#blood" role="tab" aria-controls="blood" aria-selected="true">Medical Devices</a></li>
                            <li class="nav-item" role="presentation"><a class="nav-link" id="mask-tab" data-toggle="tab" href="#mask" role="tab" aria-controls="mask" aria-selected="false">Face masks</a></li>
                            <li class="nav-item" role="presentation"><a class="nav-link" id="stomatology-tab" data-toggle="tab" href="#stomatology" role="tab" aria-controls="stomatology" aria-selected="false">Fitness & Supplements</a></li>
                        </ul>
                        <div class="tab-content" id="bestsellerTabContent">
                            <div class="tab-pane fade show active" id="blood" role="tabpanel" aria-labelledby="blood-tab">
                                <div class="owl-carousel" data-owl-auto="false" data-owl-loop="true" data-owl-speed="13000" data-owl-gap="0" data-owl-nav="true" data-owl-dots="true" data-owl-item="5" data-owl-item-xs="2" data-owl-item-sm="2" data-owl-item-md="3" data-owl-item-lg="5" data-owl-item-xl="5" data-owl-duration="1000" data-owl-mousedrag="on">
                                    <div class="ps-section__product">
                                        <div class="ps-product ps-product--standard">
                                            <div class="ps-product__thumbnail">
                                                <a class="ps-product__image" href="Shop.aspx?id=28">
                                                    <figure>
                                                        <img src="../../Images/Customer/products/001.jpg" alt="alt" /><img src="../../Images/Customer/products/009.jpg" alt="alt" />
                                                    </figure>
                                                </a>

                                                <div class="ps-product__badge">
                                                    <div class="ps-badge ps-badge--sold">Sold Out</div>
                                                </div>
                                            </div>
                                            <div class="ps-product__content">
                                                <h5 class="ps-product__title"><a href="Shop.aspx?id=28">Digital Thermometer X30-Pro</a></h5>
                                                <div class="ps-product__meta">
                                                    <span class="ps-product__price sale">LKR 4500.00</span><span class="ps-product__del">LKR 5200.00</span>
                                                </div>
                                                <div class="ps-product__rating">
                                                    <select class="ps-rating" data-read-only="true">
                                                        <option value="1">1</option>
                                                        <option value="2">2</option>
                                                        <option value="3">3</option>
                                                        <option value="4">4</option>
                                                        <option value="5" selected="selected">5</option>
                                                    </select><span class="ps-product__review">( Reviews)</span>
                                                </div>
                                                <div class="ps-product__desc">
                                                    <ul class="ps-product__list">
                                                        <li>Study history up to 30 days</li>
                                                        <li>Up to 5 users simultaneously</li>
                                                        <li>Has HEALTH certificate</li>
                                                    </ul>
                                                </div>
                                                <div class="ps-product__actions ps-product__group-mobile">
                                                    <div class="ps-product__quantity">
                                                        <div class="def-number-input number-input safari_only">
                                                            <button class="minus" onclick="this.parentNode.querySelector('input[type=number]').stepDown()"><i class="icon-minus"></i></button>
                                                            <input class="quantity" min="0" name="quantity" value="1" type="number" />
                                                            <button class="plus" onclick="this.parentNode.querySelector('input[type=number]').stepUp()"><i class="icon-plus"></i></button>
                                                        </div>
                                                    </div>

                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="ps-section__product">
                                        <div class="ps-product ps-product--standard">
                                            <div class="ps-product__thumbnail">
                                                <a class="ps-product__image" href="Shop.aspx?id=24">
                                                    <figure>
                                                        <img src="../../Images/Customer/products/New Product/4.jpg" alt="alt" /><img src="../../Images/Customer/products/New Product/4.4.jpg" alt="alt" />
                                                    </figure>
                                                </a>

                                                <div class="ps-product__badge">
                                                    <div class="ps-badge ps-badge--sale">Sale</div>
                                                    <div class="ps-badge ps-badge--hot">Hot</div>
                                                </div>
                                            </div>
                                            <div class="ps-product__content">
                                                <h5 class="ps-product__title"><a href="Shop.aspx?id=24">Fingertio Pluse Oximeter</a></h5>
                                                <div class="ps-product__meta">
                                                    <span class="ps-product__price sale">LKR 5900.00</span><span class="ps-product__del">LKR 6100.00</span>
                                                </div>
                                                <div class="ps-product__rating">
                                                    <select class="ps-rating" data-read-only="true">
                                                        <option value="1">1</option>
                                                        <option value="2">2</option>
                                                        <option value="3">3</option>
                                                        <option value="4">4</option>
                                                        <option value="5" selected="selected">5</option>
                                                    </select><span class="ps-product__review">( Reviews)</span>
                                                </div>
                                                <div class="ps-product__desc">
                                                    <ul class="ps-product__list">
                                                        <li>Study history up to 30 days</li>
                                                        <li>Up to 5 users simultaneously</li>
                                                        <li>Has HEALTH certificate</li>
                                                    </ul>
                                                </div>
                                                <div class="ps-product__actions ps-product__group-mobile">
                                                    <div class="ps-product__quantity">
                                                        <div class="def-number-input number-input safari_only">
                                                            <button class="minus" onclick="this.parentNode.querySelector('input[type=number]').stepDown()"><i class="icon-minus"></i></button>
                                                            <input class="quantity" min="0" name="quantity" value="1" type="number" />
                                                            <button class="plus" onclick="this.parentNode.querySelector('input[type=number]').stepUp()"><i class="icon-plus"></i></button>
                                                        </div>
                                                    </div>

                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="ps-section__product">
                                        <div class="ps-product ps-product--standard">
                                            <div class="ps-product__thumbnail">
                                                <a class="ps-product__image" href="Shop.aspx?id=35">
                                                    <figure>
                                                        <img src="../../Images/Customer/products/New Product/12.jpg" alt="alt" /><img src="../../Images/Customer/products/New Product/12.12.jpg" alt="alt" />
                                                    </figure>
                                                </a>

                                                <div class="ps-product__badge">
                                                </div>
                                            </div>
                                            <div class="ps-product__content">
                                                <h5 class="ps-product__title"><a href="Shop.aspx?id=35">Infrared Thermometer</a></h5>
                                                <div class="ps-product__meta">
                                                    <span class="ps-product__price sale">LKR 1990.00</span><span class="ps-product__del">LKR 2150.00</span>
                                                </div>
                                                <div class="ps-product__rating">
                                                    <select class="ps-rating" data-read-only="true">
                                                        <option value="1">1</option>
                                                        <option value="2">2</option>
                                                        <option value="3">3</option>
                                                        <option value="4">4</option>
                                                        <option value="5" selected="selected">5</option>
                                                    </select><span class="ps-product__review">( Reviews)</span>
                                                </div>
                                                <div class="ps-product__desc">
                                                    <ul class="ps-product__list">
                                                        <li>Study history up to 30 days</li>
                                                        <li>Up to 5 users simultaneously</li>
                                                        <li>Has HEALTH certificate</li>
                                                    </ul>
                                                </div>
                                                <div class="ps-product__actions ps-product__group-mobile">
                                                    <div class="ps-product__quantity">
                                                        <div class="def-number-input number-input safari_only">
                                                            <button class="minus" onclick="this.parentNode.querySelector('input[type=number]').stepDown()"><i class="icon-minus"></i></button>
                                                            <input class="quantity" min="0" name="quantity" value="1" type="number" />
                                                            <button class="plus" onclick="this.parentNode.querySelector('input[type=number]').stepUp()"><i class="icon-plus"></i></button>
                                                        </div>
                                                    </div>

                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="ps-section__product">
                                        <div class="ps-product ps-product--standard">
                                            <div class="ps-product__thumbnail">
                                                <a class="ps-product__image" href="Shop.aspx?id=36">
                                                    <figure>
                                                        <img src="../../Images/Customer/products/New Product/13.jpg" alt="alt" /><img src="../../Images/Customer/products/New Product/13.13.jpg" alt="alt" />
                                                    </figure>
                                                </a>

                                                <div class="ps-product__badge">
                                                </div>
                                            </div>
                                            <div class="ps-product__content">
                                                <h5 class="ps-product__title"><a href="Shop.aspx?id=36">Rossmax Digital Thermometer TG100</a></h5>
                                                <div class="ps-product__meta">
                                                    <span class="ps-product__price sale">LKR 1150.00</span><span class="ps-product__del">LKR 1200.00</span>
                                                </div>
                                                <div class="ps-product__rating">
                                                    <select class="ps-rating" data-read-only="true">
                                                        <option value="1">1</option>
                                                        <option value="2">2</option>
                                                        <option value="3">3</option>
                                                        <option value="4">4</option>
                                                        <option value="5" selected="selected">5</option>
                                                    </select><span class="ps-product__review">( Reviews)</span>
                                                </div>
                                                <div class="ps-product__desc">
                                                    <ul class="ps-product__list">
                                                        <li>Study history up to 30 days</li>
                                                        <li>Up to 5 users simultaneously</li>
                                                        <li>Has HEALTH certificate</li>
                                                    </ul>
                                                </div>
                                                <div class="ps-product__actions ps-product__group-mobile">
                                                    <div class="ps-product__quantity">
                                                        <div class="def-number-input number-input safari_only">
                                                            <button class="minus" onclick="this.parentNode.querySelector('input[type=number]').stepDown()"><i class="icon-minus"></i></button>
                                                            <input class="quantity" min="0" name="quantity" value="1" type="number" />
                                                            <button class="plus" onclick="this.parentNode.querySelector('input[type=number]').stepUp()"><i class="icon-plus"></i></button>
                                                        </div>
                                                    </div>

                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="ps-section__product">
                                        <div class="ps-product ps-product--standard">
                                            <div class="ps-product__thumbnail">
                                                <a class="ps-product__image" href="Shop.aspx?id=18">
                                                    <figure>
                                                        <img src="../../Images/Customer/products/New Product/14.jpg" alt="alt" /><img src="../../Images/Customer/products/New Product/14.14.jpg" alt="alt" />
                                                    </figure>
                                                </a>

                                                <div class="ps-product__badge">
                                                    <div class="ps-badge ps-badge--sold">Sold Out</div>
                                                </div>
                                            </div>
                                            <div class="ps-product__content">
                                                <h5 class="ps-product__title"><a href="Shop.aspx?id=18">Accu-Chek Active Blood Glucose Monitor</a></h5>
                                                <div class="ps-product__meta">
                                                    <span class="ps-product__price sale">LKR 5650.00</span><span class="ps-product__del">LKR 5800.00</span>
                                                </div>
                                                <div class="ps-product__rating">
                                                    <select class="ps-rating" data-read-only="true">
                                                        <option value="1">1</option>
                                                        <option value="2">2</option>
                                                        <option value="3">3</option>
                                                        <option value="4" selected="selected">4</option>
                                                        <option value="5">5</option>
                                                    </select><span class="ps-product__review">( Reviews)</span>
                                                </div>
                                                <div class="ps-product__desc">
                                                    <ul class="ps-product__list">
                                                        <li>Study history up to 30 days</li>
                                                        <li>Up to 5 users simultaneously</li>
                                                        <li>Has HEALTH certificate</li>
                                                    </ul>
                                                </div>
                                                <div class="ps-product__actions ps-product__group-mobile">
                                                    <div class="ps-product__quantity">
                                                        <div class="def-number-input number-input safari_only">
                                                            <button class="minus" onclick="this.parentNode.querySelector('input[type=number]').stepDown()"><i class="icon-minus"></i></button>
                                                            <input class="quantity" min="0" name="quantity" value="1" type="number" />
                                                            <button class="plus" onclick="this.parentNode.querySelector('input[type=number]').stepUp()"><i class="icon-plus"></i></button>
                                                        </div>
                                                    </div>

                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="ps-section__product">
                                        <div class="ps-product ps-product--standard">
                                            <div class="ps-product__thumbnail">
                                                <a class="ps-product__image" href="Shop.aspx?id=37">
                                                    <figure>
                                                        <img src="../../Images/Customer/products/New Product/16.jpg" alt="alt" /><img src="../../Images/Customer/products/New Product/16.16.jpg" alt="alt" />
                                                    </figure>
                                                </a>

                                                <div class="ps-product__badge">
                                                    <div class="ps-badge ps-badge--sale">Sale</div>
                                                </div>
                                            </div>
                                            <div class="ps-product__content">
                                                <h5 class="ps-product__title"><a href="Shop.aspx?id=37">Asthma Inhaler Medicine</a></h5>
                                                <div class="ps-product__meta">
                                                    <span class="ps-product__price">LKR 2350.00</span>
                                                </div>
                                                <div class="ps-product__rating">
                                                    <select class="ps-rating" data-read-only="true">
                                                        <option value="1">1</option>
                                                        <option value="2">2</option>
                                                        <option value="3">3</option>
                                                        <option value="4" selected="selected">4</option>
                                                        <option value="5">5</option>
                                                    </select><span class="ps-product__review">( Reviews)</span>
                                                </div>
                                                <div class="ps-product__desc">
                                                    <ul class="ps-product__list">
                                                        <li>Study history up to 30 days</li>
                                                        <li>Up to 5 users simultaneously</li>
                                                        <li>Has HEALTH certificate</li>
                                                    </ul>
                                                </div>
                                                <div class="ps-product__actions ps-product__group-mobile">
                                                    <div class="ps-product__quantity">
                                                        <div class="def-number-input number-input safari_only">
                                                            <button class="minus" onclick="this.parentNode.querySelector('input[type=number]').stepDown()"><i class="icon-minus"></i></button>
                                                            <input class="quantity" min="0" name="quantity" value="1" type="number" />
                                                            <button class="plus" onclick="this.parentNode.querySelector('input[type=number]').stepUp()"><i class="icon-plus"></i></button>
                                                        </div>
                                                    </div>

                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="tab-pane fade" id="mask" role="tabpanel" aria-labelledby="mask-tab">
                                <div class="owl-carousel" data-owl-auto="false" data-owl-loop="true" data-owl-speed="13000" data-owl-gap="0" data-owl-nav="true" data-owl-dots="true" data-owl-item="5" data-owl-item-xs="2" data-owl-item-sm="2" data-owl-item-md="3" data-owl-item-lg="5" data-owl-item-xl="5" data-owl-duration="1000" data-owl-mousedrag="on">
                                    <div class="ps-section__product">
                                        <div class="ps-product ps-product--standard">
                                            <div class="ps-product__thumbnail">
                                                <a class="ps-product__image" href="Shop.aspx?id=31">
                                                    <figure>
                                                        <img src="../../Images/Customer/products/New Product/3.jpg" alt="alt" /><img src="../../Images/Customer/products/New Product/3.3.jpg" alt="alt" />
                                                    </figure>
                                                </a>

                                                <div class="ps-product__badge">
                                                    <div class="ps-badge ps-badge--sale">Sale</div>
                                                </div>
                                            </div>
                                            <div class="ps-product__content">
                                                <h5 class="ps-product__title"><a href="Shop.aspx?id=31">KN95 Original 5 Layer Face Mask</a></h5>
                                                <div class="ps-product__meta">
                                                    <span class="ps-product__price sale">LKR 80.00</span><span class="ps-product__del">LKR 100.00</span>
                                                </div>
                                                <div class="ps-product__rating">
                                                    <select class="ps-rating" data-read-only="true">
                                                        <option value="1">1</option>
                                                        <option value="2">2</option>
                                                        <option value="3">3</option>
                                                        <option value="4">4</option>
                                                        <option value="5" selected="selected">5</option>
                                                    </select><span class="ps-product__review">( Reviews)</span>
                                                </div>
                                                <div class="ps-product__desc">
                                                    <ul class="ps-product__list">
                                                        <li>Study history up to 30 days</li>
                                                        <li>Up to 5 users simultaneously</li>
                                                        <li>Has HEALTH certificate</li>
                                                    </ul>
                                                </div>
                                                <div class="ps-product__actions ps-product__group-mobile">
                                                    <div class="ps-product__quantity">
                                                        <div class="def-number-input number-input safari_only">
                                                            <button class="minus" onclick="this.parentNode.querySelector('input[type=number]').stepDown()"><i class="icon-minus"></i></button>
                                                            <input class="quantity" min="0" name="quantity" value="1" type="number" />
                                                            <button class="plus" onclick="this.parentNode.querySelector('input[type=number]').stepUp()"><i class="icon-plus"></i></button>
                                                        </div>
                                                    </div>

                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="ps-section__product">
                                        <div class="ps-product ps-product--standard">
                                            <div class="ps-product__thumbnail">
                                                <a class="ps-product__image" href="Shop.aspx?id=38">
                                                    <figure>
                                                        <img src="../../Images/Customer/products/051.jpg" alt="alt" /><img src="../../Images/Customer/products/052.jpg" alt="alt" />
                                                    </figure>
                                                </a>

                                                <div class="ps-product__badge">
                                                    <div class="ps-badge ps-badge--sold">Sold Out</div>
                                                </div>
                                            </div>
                                            <div class="ps-product__content">
                                                <h5 class="ps-product__title"><a href="Shop.aspx?id=38">3-Ply Ear-Loop Disposable Blue Face Mask</a></h5>
                                                <div class="ps-product__meta">
                                                    <span class="ps-product__price sale">LKR 30.00</span><span class="ps-product__del">LKR 35.00</span>
                                                </div>
                                                <div class="ps-product__rating">
                                                    <select class="ps-rating" data-read-only="true">
                                                        <option value="1">1</option>
                                                        <option value="2">2</option>
                                                        <option value="3">3</option>
                                                        <option value="4">4</option>
                                                        <option value="5">5</option>
                                                    </select><span class="ps-product__review">( Reviews)</span>
                                                </div>
                                                <div class="ps-product__desc">
                                                    <ul class="ps-product__list">
                                                        <li>Study history up to 30 days</li>
                                                        <li>Up to 5 users simultaneously</li>
                                                        <li>Has HEALTH certificate</li>
                                                    </ul>
                                                </div>
                                                <div class="ps-product__actions ps-product__group-mobile">
                                                    <div class="ps-product__quantity">
                                                        <div class="def-number-input number-input safari_only">
                                                            <button class="minus" onclick="this.parentNode.querySelector('input[type=number]').stepDown()"><i class="icon-minus"></i></button>
                                                            <input class="quantity" min="0" name="quantity" value="1" type="number" />
                                                            <button class="plus" onclick="this.parentNode.querySelector('input[type=number]').stepUp()"><i class="icon-plus"></i></button>
                                                        </div>
                                                    </div>

                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="ps-section__product">
                                        <div class="ps-product ps-product--standard">
                                            <div class="ps-product__thumbnail">
                                                <a class="ps-product__image" href="Shop.aspx?id=32">
                                                    <figure>
                                                        <img src="../../Images/Customer/products/050.jpg" alt="alt" /><img src="../../Images/Customer/products/052.jpg" alt="alt" />
                                                    </figure>
                                                </a>

                                                <div class="ps-product__badge">
                                                </div>
                                            </div>
                                            <div class="ps-product__content">
                                                <h5 class="ps-product__title"><a href="Shop.aspx?id=32">Disposable Face Mask for Unisex</a></h5>
                                                <div class="ps-product__meta">
                                                    <span class="ps-product__price sale">LKR 20.00</span><span class="ps-product__del">LKR 25.00</span>
                                                </div>
                                                <div class="ps-product__rating">
                                                    <select class="ps-rating" data-read-only="true">
                                                        <option value="1">1</option>
                                                        <option value="2">2</option>
                                                        <option value="3">3</option>
                                                        <option value="4">4</option>
                                                        <option value="5" selected="selected">5</option>
                                                    </select><span class="ps-product__review">( Reviews)</span>
                                                </div>
                                                <div class="ps-product__desc">
                                                    <ul class="ps-product__list">
                                                        <li>Study history up to 30 days</li>
                                                        <li>Up to 5 users simultaneously</li>
                                                        <li>Has HEALTH certificate</li>
                                                    </ul>
                                                </div>
                                                <div class="ps-product__actions ps-product__group-mobile">
                                                    <div class="ps-product__quantity">
                                                        <div class="def-number-input number-input safari_only">
                                                            <button class="minus" onclick="this.parentNode.querySelector('input[type=number]').stepDown()"><i class="icon-minus"></i></button>
                                                            <input class="quantity" min="0" name="quantity" value="1" type="number" />
                                                            <button class="plus" onclick="this.parentNode.querySelector('input[type=number]').stepUp()"><i class="icon-plus"></i></button>
                                                        </div>
                                                    </div>

                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="ps-section__product">
                                        <div class="ps-product ps-product--standard">
                                            <div class="ps-product__thumbnail">
                                                <a class="ps-product__image" href="Shop.aspx?id=39">
                                                    <figure>
                                                        <img src="../../Images/Customer/products/033.jpg" alt="alt" /><img src="../../Images/Customer/products/052.jpg" alt="alt" />
                                                    </figure>
                                                </a>

                                                <div class="ps-product__badge">
                                                    <div class="ps-badge ps-badge--sold">Sold Out</div>
                                                </div>
                                            </div>
                                            <div class="ps-product__content">
                                                <h5 class="ps-product__title"><a href="Shop.aspx?id=39">3 Layer Disposable Protective Face Masks</a></h5>
                                                <div class="ps-product__meta">
                                                    <span class="ps-product__price sale">LKR 20.00</span><span class="ps-product__del">LKR 30.00</span>
                                                </div>
                                                <div class="ps-product__rating">
                                                    <select class="ps-rating" data-read-only="true">
                                                        <option value="1">1</option>
                                                        <option value="2">2</option>
                                                        <option value="3">3</option>
                                                        <option value="4">4</option>
                                                        <option value="5" selected="selected">5</option>
                                                    </select><span class="ps-product__review">( Reviews)</span>
                                                </div>
                                                <div class="ps-product__desc">
                                                    <ul class="ps-product__list">
                                                        <li>Study history up to 30 days</li>
                                                        <li>Up to 5 users simultaneously</li>
                                                        <li>Has HEALTH certificate</li>
                                                    </ul>
                                                </div>
                                                <div class="ps-product__actions ps-product__group-mobile">
                                                    <div class="ps-product__quantity">
                                                        <div class="def-number-input number-input safari_only">
                                                            <button class="minus" onclick="this.parentNode.querySelector('input[type=number]').stepDown()"><i class="icon-minus"></i></button>
                                                            <input class="quantity" min="0" name="quantity" value="1" type="number" />
                                                            <button class="plus" onclick="this.parentNode.querySelector('input[type=number]').stepUp()"><i class="icon-plus"></i></button>
                                                        </div>
                                                    </div>

                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="ps-section__product">
                                        <div class="ps-product ps-product--standard">
                                            <div class="ps-product__thumbnail">
                                                <a class="ps-product__image" href="Shop.aspx?id=40">
                                                    <figure>
                                                        <img src="../../Images/Customer/products/New Product/15.jpg" alt="alt" /><img src="../../Images/Customer/products/New Product/15.15.jpg" alt="alt" />
                                                    </figure>
                                                </a>

                                                <div class="ps-product__badge">
                                                    <div class="ps-badge ps-badge--sale">Sale</div>
                                                </div>
                                            </div>
                                            <div class="ps-product__content">
                                                <h5 class="ps-product__title"><a href="Shop.aspx?id=40">Oxypura Care Face Mask</a></h5>
                                                <div class="ps-product__meta">
                                                    <span class="ps-product__price">LKR 150.00</span>
                                                </div>
                                                <div class="ps-product__rating">
                                                    <select class="ps-rating" data-read-only="true">
                                                        <option value="1">1</option>
                                                        <option value="2" selected="selected">2</option>
                                                        <option value="3">3</option>
                                                        <option value="4">4</option>
                                                        <option value="5">5</option>
                                                    </select><span class="ps-product__review">( Reviews)</span>
                                                </div>
                                                <div class="ps-product__desc">
                                                    <ul class="ps-product__list">
                                                        <li>Study history up to 30 days</li>
                                                        <li>Up to 5 users simultaneously</li>
                                                        <li>Has HEALTH certificate</li>
                                                    </ul>
                                                </div>
                                                <div class="ps-product__actions ps-product__group-mobile">
                                                    <div class="ps-product__quantity">
                                                        <div class="def-number-input number-input safari_only">
                                                            <button class="minus" onclick="this.parentNode.querySelector('input[type=number]').stepDown()"><i class="icon-minus"></i></button>
                                                            <input class="quantity" min="0" name="quantity" value="1" type="number" />
                                                            <button class="plus" onclick="this.parentNode.querySelector('input[type=number]').stepUp()"><i class="icon-plus"></i></button>
                                                        </div>
                                                    </div>

                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="ps-section__product">
                                        <div class="ps-product ps-product--standard">
                                            <div class="ps-product__thumbnail">
                                                <a class="ps-product__image" href="Shop.aspx?id=41">
                                                    <figure>
                                                        <img src="../../Images/Customer/products/051.jpg" alt="alt" /><img src="../../Images/Customer/products/052.jpg" alt="alt" />
                                                    </figure>
                                                </a>

                                                <div class="ps-product__badge">
                                                    <div class="ps-badge ps-badge--sale">Sale</div>
                                                </div>
                                            </div>
                                            <div class="ps-product__content">
                                                <h5 class="ps-product__title"><a href="Shop.aspx?id=41">3-Ply Ear-Loop Disposable Blue Face Mask 50 Pack</a></h5>
                                                <div class="ps-product__meta">
                                                    <span class="ps-product__price sale">LKR 450.00</span><span class="ps-product__del">LKR 500.00</span>
                                                </div>
                                                <div class="ps-product__rating">
                                                    <select class="ps-rating" data-read-only="true">
                                                        <option value="1">1</option>
                                                        <option value="2" selected="selected">2</option>
                                                        <option value="3">3</option>
                                                        <option value="4">4</option>
                                                        <option value="5">5</option>
                                                    </select><span class="ps-product__review">( Reviews)</span>
                                                </div>
                                                <div class="ps-product__desc">
                                                    <ul class="ps-product__list">
                                                        <li>Study history up to 30 days</li>
                                                        <li>Up to 5 users simultaneously</li>
                                                        <li>Has HEALTH certificate</li>
                                                    </ul>
                                                </div>
                                                <div class="ps-product__actions ps-product__group-mobile">
                                                    <div class="ps-product__quantity">
                                                        <div class="def-number-input number-input safari_only">
                                                            <button class="minus" onclick="this.parentNode.querySelector('input[type=number]').stepDown()"><i class="icon-minus"></i></button>
                                                            <input class="quantity" min="0" name="quantity" value="1" type="number" />
                                                            <button class="plus" onclick="this.parentNode.querySelector('input[type=number]').stepUp()"><i class="icon-plus"></i></button>
                                                        </div>
                                                    </div>

                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="tab-pane fade" id="stomatology" role="tabpanel" aria-labelledby="stomatology-tab">
                                <div class="owl-carousel" data-owl-auto="false" data-owl-loop="true" data-owl-speed="13000" data-owl-gap="0" data-owl-nav="true" data-owl-dots="true" data-owl-item="5" data-owl-item-xs="2" data-owl-item-sm="2" data-owl-item-md="3" data-owl-item-lg="5" data-owl-item-xl="5" data-owl-duration="1000" data-owl-mousedrag="on">
                                    <div class="ps-section__product">
                                        <div class="ps-product ps-product--standard">
                                            <div class="ps-product__thumbnail">
                                                <a class="ps-product__image" href="Shop.aspx?id=20">
                                                    <figure>
                                                        <img src="../../Images/Customer/products/New Product/17.jpg" alt="alt" /><img src="../../Images/Customer/products/New Product/17.17.jpg" alt="alt" />
                                                    </figure>
                                                </a>

                                                <div class="ps-product__badge">
                                                    <div class="ps-badge ps-badge--hot">Hot</div>
                                                </div>
                                            </div>
                                            <div class="ps-product__content">
                                                <h5 class="ps-product__title"><a href="Shop.aspx?id=20">Sustagen Vanilla 400g</a></h5>
                                                <div class="ps-product__meta">
                                                    <span class="ps-product__price">LKR 2000.00</span>
                                                </div>
                                                <div class="ps-product__rating">
                                                    <select class="ps-rating" data-read-only="true">
                                                        <option value="1">1</option>
                                                        <option value="2">2</option>
                                                        <option value="3">3</option>
                                                        <option value="4" selected="selected">4</option>
                                                        <option value="5">5</option>
                                                    </select><span class="ps-product__review">( Reviews)</span>
                                                </div>
                                                <div class="ps-product__desc">
                                                    <ul class="ps-product__list">
                                                        <li>Study history up to 30 days</li>
                                                        <li>Up to 5 users simultaneously</li>
                                                        <li>Has HEALTH certificate</li>
                                                    </ul>
                                                </div>
                                                <div class="ps-product__actions ps-product__group-mobile">
                                                    <div class="ps-product__quantity">
                                                        <div class="def-number-input number-input safari_only">
                                                            <button class="minus" onclick="this.parentNode.querySelector('input[type=number]').stepDown()"><i class="icon-minus"></i></button>
                                                            <input class="quantity" min="0" name="quantity" value="1" type="number" />
                                                            <button class="plus" onclick="this.parentNode.querySelector('input[type=number]').stepUp()"><i class="icon-plus"></i></button>
                                                        </div>
                                                    </div>

                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="ps-section__product">
                                        <div class="ps-product ps-product--standard">
                                            <div class="ps-product__thumbnail">
                                                <a class="ps-product__image" href="Shop.aspx?id=42">
                                                    <figure>
                                                        <img src="../../Images/Customer/products/New Product/18.jpg" alt="alt" /><img src="../../Images/Customer/products/New Product/18.18.jpg" alt="alt" />
                                                    </figure>
                                                </a>

                                                <div class="ps-product__badge">
                                                </div>
                                            </div>
                                            <div class="ps-product__content">
                                                <h5 class="ps-product__title"><a href="Shop.aspx?id=42">Shape Up Tea 40g Pack - 20 Tea Bags</a></h5>
                                                <div class="ps-product__meta">
                                                    <span class="ps-product__price sale">LKR 600.00</span><span class="ps-product__del">LKR 650.00</span>
                                                </div>
                                                <div class="ps-product__rating">
                                                    <select class="ps-rating" data-read-only="true">
                                                        <option value="1">1</option>
                                                        <option value="2">2</option>
                                                        <option value="3">3</option>
                                                        <option value="4">4</option>
                                                        <option value="5" selected="selected">5</option>
                                                    </select><span class="ps-product__review">( Reviews)</span>
                                                </div>
                                                <div class="ps-product__desc">
                                                    <ul class="ps-product__list">
                                                        <li>Study history up to 30 days</li>
                                                        <li>Up to 5 users simultaneously</li>
                                                        <li>Has HEALTH certificate</li>
                                                    </ul>
                                                </div>
                                                <div class="ps-product__actions ps-product__group-mobile">
                                                    <div class="ps-product__quantity">
                                                        <div class="def-number-input number-input safari_only">
                                                            <button class="minus" onclick="this.parentNode.querySelector('input[type=number]').stepDown()"><i class="icon-minus"></i></button>
                                                            <input class="quantity" min="0" name="quantity" value="1" type="number" />
                                                            <button class="plus" onclick="this.parentNode.querySelector('input[type=number]').stepUp()"><i class="icon-plus"></i></button>
                                                        </div>
                                                    </div>

                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="ps-section__product">
                                        <div class="ps-product ps-product--standard">
                                            <div class="ps-product__thumbnail">
                                                <a class="ps-product__image" href="Shop.aspx?id=43">
                                                    <figure>
                                                        <img src="../../Images/Customer/products/New Product/19.jpg" alt="alt" /><img src="../../Images/Customer/products/New Product/19.19.jpg" alt="alt" />
                                                    </figure>
                                                </a>

                                                <div class="ps-product__badge">
                                                </div>
                                            </div>
                                            <div class="ps-product__content">
                                                <h5 class="ps-product__title"><a href="Shop.aspx?id=43">Biona – 30 Capsules</a></h5>
                                                <div class="ps-product__meta">
                                                    <span class="ps-product__price">LKR 2270.00</span>
                                                </div>
                                                <div class="ps-product__rating">
                                                    <select class="ps-rating" data-read-only="true">
                                                        <option value="1">1</option>
                                                        <option value="2">2</option>
                                                        <option value="3">3</option>
                                                        <option value="4">4</option>
                                                        <option value="5" selected="selected">5</option>
                                                    </select><span class="ps-product__review">( Reviews)</span>
                                                </div>
                                                <div class="ps-product__desc">
                                                    <ul class="ps-product__list">
                                                        <li>Study history up to 30 days</li>
                                                        <li>Up to 5 users simultaneously</li>
                                                        <li>Has HEALTH certificate</li>
                                                    </ul>
                                                </div>
                                                <div class="ps-product__actions ps-product__group-mobile">
                                                    <div class="ps-product__quantity">
                                                        <div class="def-number-input number-input safari_only">
                                                            <button class="minus" onclick="this.parentNode.querySelector('input[type=number]').stepDown()"><i class="icon-minus"></i></button>
                                                            <input class="quantity" min="0" name="quantity" value="1" type="number" />
                                                            <button class="plus" onclick="this.parentNode.querySelector('input[type=number]').stepUp()"><i class="icon-plus"></i></button>
                                                        </div>
                                                    </div>

                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="ps-section__product">
                                        <div class="ps-product ps-product--standard">
                                            <div class="ps-product__thumbnail">
                                                <a class="ps-product__image" href="Shop.aspx?id=44">
                                                    <figure>
                                                        <img src="../../Images/Customer/products/New Product/20.jpg" alt="alt" /><img src="../../Images/Customer/products/New Product/20.20.jpg" alt="alt" />
                                                    </figure>
                                                </a>

                                                <div class="ps-product__badge">
                                                </div>
                                            </div>
                                            <div class="ps-product__content">
                                                <h5 class="ps-product__title"><a href="Shop.aspx?id=44">Biovita Radiant 30 Caps</a></h5>
                                                <div class="ps-product__meta">
                                                    <span class="ps-product__price">LKR 2340.00</span>
                                                </div>
                                                <div class="ps-product__rating">
                                                    <select class="ps-rating" data-read-only="true">
                                                        <option value="1">1</option>
                                                        <option value="2">2</option>
                                                        <option value="3">3</option>
                                                        <option value="4">4</option>
                                                        <option value="5" selected="selected">5</option>
                                                    </select><span class="ps-product__review">( Reviews)</span>
                                                </div>
                                                <div class="ps-product__desc">
                                                    <ul class="ps-product__list">
                                                        <li>Study history up to 30 days</li>
                                                        <li>Up to 5 users simultaneously</li>
                                                        <li>Has HEALTH certificate</li>
                                                    </ul>
                                                </div>
                                                <div class="ps-product__actions ps-product__group-mobile">
                                                    <div class="ps-product__quantity">
                                                        <div class="def-number-input number-input safari_only">
                                                            <button class="minus" onclick="this.parentNode.querySelector('input[type=number]').stepDown()"><i class="icon-minus"></i></button>
                                                            <input class="quantity" min="0" name="quantity" value="1" type="number" />
                                                            <button class="plus" onclick="this.parentNode.querySelector('input[type=number]').stepUp()"><i class="icon-plus"></i></button>
                                                        </div>
                                                    </div>

                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="ps-section__product">
                                        <div class="ps-product ps-product--standard">
                                            <div class="ps-product__thumbnail">
                                                <a class="ps-product__image" href="Shop.aspx?id=45">
                                                    <figure>
                                                        <img src="../../Images/Customer/products/New Product/21.jpg" alt="alt" /><img src="../../Images/Customer/products/New Product/21.21.jpg" alt="alt" />
                                                    </figure>
                                                </a>

                                                <div class="ps-product__badge">
                                                </div>
                                            </div>
                                            <div class="ps-product__content">
                                                <h5 class="ps-product__title"><a href="Shop.aspx?id=45">Saaralife - Trim'n'fit 30's</a></h5>
                                                <div class="ps-product__meta">
                                                    <span class="ps-product__price">LKR 960.00</span>
                                                </div>
                                                <div class="ps-product__rating">
                                                    <select class="ps-rating" data-read-only="true">
                                                        <option value="1">1</option>
                                                        <option value="2">2</option>
                                                        <option value="3">3</option>
                                                        <option value="4" selected="selected">4</option>
                                                        <option value="5">5</option>
                                                    </select><span class="ps-product__review">( Reviews)</span>
                                                </div>
                                                <div class="ps-product__desc">
                                                    <ul class="ps-product__list">
                                                        <li>Study history up to 30 days</li>
                                                        <li>Up to 5 users simultaneously</li>
                                                        <li>Has HEALTH certificate</li>
                                                    </ul>
                                                </div>
                                                <div class="ps-product__actions ps-product__group-mobile">
                                                    <div class="ps-product__quantity">
                                                        <div class="def-number-input number-input safari_only">
                                                            <button class="minus" onclick="this.parentNode.querySelector('input[type=number]').stepDown()"><i class="icon-minus"></i></button>
                                                            <input class="quantity" min="0" name="quantity" value="1" type="number" />
                                                            <button class="plus" onclick="this.parentNode.querySelector('input[type=number]').stepUp()"><i class="icon-plus"></i></button>
                                                        </div>
                                                    </div>

                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="ps-section__product">
                                        <div class="ps-product ps-product--standard">
                                            <div class="ps-product__thumbnail">
                                                <a class="ps-product__image" href="Shop.aspx?id=27">
                                                    <figure>
                                                        <img src="../../Images/Customer/products/New Product/6.jpg" alt="alt" /><img src="../../Images/Customer/products/New Product/6.6.jpg" alt="alt" />
                                                    </figure>
                                                </a>

                                                <div class="ps-product__badge">
                                                </div>
                                            </div>
                                            <div class="ps-product__content">
                                                <h5 class="ps-product__title"><a href="Shop.aspx?id=27">Maliban Milk Powder Vitagen Tin 400g</a></h5>
                                                <div class="ps-product__meta">
                                                    <span class="ps-product__price">LKR 1600.00</span>
                                                </div>
                                                <div class="ps-product__rating">
                                                    <select class="ps-rating" data-read-only="true">
                                                        <option value="1">1</option>
                                                        <option value="2">2</option>
                                                        <option value="3">3</option>
                                                        <option value="4" selected="selected">4</option>
                                                        <option value="5">5</option>
                                                    </select><span class="ps-product__review">( Reviews)</span>
                                                </div>
                                                <div class="ps-product__desc">
                                                    <ul class="ps-product__list">
                                                        <li>Study history up to 30 days</li>
                                                        <li>Up to 5 users simultaneously</li>
                                                        <li>Has HEALTH certificate</li>
                                                    </ul>
                                                </div>
                                                <div class="ps-product__actions ps-product__group-mobile">
                                                    <div class="ps-product__quantity">
                                                        <div class="def-number-input number-input safari_only">
                                                            <button class="minus" onclick="this.parentNode.querySelector('input[type=number]').stepDown()"><i class="icon-minus"></i></button>
                                                            <input class="quantity" min="0" name="quantity" value="1" type="number" />
                                                            <button class="plus" onclick="this.parentNode.querySelector('input[type=number]').stepUp()"><i class="icon-plus"></i></button>
                                                        </div>
                                                    </div>

                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </section>
                <div class="ps-promo">
                    <div class="row">
                        <div class="col-12 col-md-6">
                            <div class="ps-promo__item">
                                <img class="ps-promo__banner" src="../../Images/Customer/promotion/bg-banner4.jpg" alt="alt" />
                                <div class="ps-promo__content">
                                    <span class="ps-promo__badge">New</span>
                                    <h4 class="mb-20 ps-promo__name">Get rid of bacteria
                                        <br />
                                        in your home</h4>
                                    <a class="ps-promo__btn" href="Shop.aspx">More</a>
                                </div>
                            </div>
                        </div>
                        <div class="col-12 col-md-6">
                            <div class="ps-promo__item">
                                <img class="ps-promo__banner" src="../../Images/Customer/products/New Product/bg-bannerNew1.jpg" alt="alt" />
                                <div class="ps-promo__content">
                                    <h4 class="ps-promo__name">The Best Solution
                                        <br />
                                        For Gastritis </h4>
                                    <div class="ps-promo__sale">-5%</div>
                                    <a class="ps-promo__btn" href="Shop.aspx?id=29">Shop now</a>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <section class="ps-section--featured">
                    <h3 class="ps-section__title">Featured products</h3>
                    <div class="ps-section__content">
                        <div class="row m-0">
                            <div class="col-6 col-md-4 col-lg-2dot4 p-0">
                                <div class="ps-section__product">
                                    <div class="ps-product ps-product--standard">
                                        <div class="ps-product__thumbnail">
                                            <a class="ps-product__image" href="Shop.aspx?id=24">
                                                <figure>
                                                    <img src="../../Images/Customer/products/New Product/4.jpg" alt="alt" /><img src="../../Images/Customer/products/New Product/4.4.jpg" alt="alt" />
                                                </figure>
                                            </a>

                                            <div class="ps-product__badge">
                                                <div class="ps-badge ps-badge--sale">Sale</div>
                                            </div>
                                        </div>
                                        <div class="ps-product__content">
                                            <h5 class="ps-product__title"><a href="Shop.aspx?id=24">Fingertio Pluse Oximeter</a></h5>
                                            <div class="ps-product__meta">
                                                <span class="ps-product__price">LKR 5900.00</span>
                                            </div>
                                            <div class="ps-product__rating">
                                                <select class="ps-rating" data-read-only="true">
                                                    <option value="1">1</option>
                                                    <option value="2">2</option>
                                                    <option value="3">3</option>
                                                    <option value="4" selected="selected">4</option>
                                                    <option value="5">5</option>
                                                </select><span class="ps-product__review">( Reviews)</span>
                                            </div>
                                            <div class="ps-product__desc">
                                                <ul class="ps-product__list">
                                                    <li>Study history up to 30 days</li>
                                                    <li>Up to 5 users simultaneously</li>
                                                    <li>Has HEALTH certificate</li>
                                                </ul>
                                            </div>
                                            <div class="ps-product__actions ps-product__group-mobile">
                                                <div class="ps-product__quantity">
                                                    <div class="def-number-input number-input safari_only">
                                                        <button class="minus" onclick="this.parentNode.querySelector('input[type=number]').stepDown()"><i class="icon-minus"></i></button>
                                                        <input class="quantity" min="0" name="quantity" value="1" type="number" />
                                                        <button class="plus" onclick="this.parentNode.querySelector('input[type=number]').stepUp()"><i class="icon-plus"></i></button>
                                                    </div>
                                                </div>

                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="col-6 col-md-4 col-lg-2dot4 p-0">
                                <div class="ps-section__product">
                                    <div class="ps-product ps-product--standard">
                                        <div class="ps-product__thumbnail">
                                            <a class="ps-product__image" href="Shop.aspx?id=45">
                                                <figure>
                                                    <img src="../../Images/Customer/products/New Product/21.jpg" alt="alt" /><img src="../../Images/Customer/products/New Product/21.21.jpg" alt="alt" />
                                                </figure>
                                            </a>

                                            <div class="ps-product__badge">
                                                <div class="ps-badge ps-badge--sale">Sale</div>
                                            </div>
                                        </div>
                                        <div class="ps-product__content">
                                            <h5 class="ps-product__title"><a href="Shop.aspx?id=45">Saaralife - Trim'n'fit 30's</a></h5>
                                            <div class="ps-product__meta">
                                                <span class="ps-product__price sale">LKR 960.00</span><span class="ps-product__del">LKR 1000.00</span>
                                            </div>
                                            <div class="ps-product__rating">
                                                <select class="ps-rating" data-read-only="true">
                                                    <option value="1">1</option>
                                                    <option value="2">2</option>
                                                    <option value="3">3</option>
                                                    <option value="4" selected="selected">4</option>
                                                    <option value="5">5</option>
                                                </select><span class="ps-product__review">( Reviews)</span>
                                            </div>
                                            <div class="ps-product__desc">
                                                <ul class="ps-product__list">
                                                    <li>Study history up to 30 days</li>
                                                    <li>Up to 5 users simultaneously</li>
                                                    <li>Has HEALTH certificate</li>
                                                </ul>
                                            </div>
                                            <div class="ps-product__actions ps-product__group-mobile">
                                                <div class="ps-product__quantity">
                                                    <div class="def-number-input number-input safari_only">
                                                        <button class="minus" onclick="this.parentNode.querySelector('input[type=number]').stepDown()"><i class="icon-minus"></i></button>
                                                        <input class="quantity" min="0" name="quantity" value="1" type="number" />
                                                        <button class="plus" onclick="this.parentNode.querySelector('input[type=number]').stepUp()"><i class="icon-plus"></i></button>
                                                    </div>
                                                </div>

                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="col-6 col-md-4 col-lg-2dot4 p-0">
                                <div class="ps-section__product">
                                    <div class="ps-product ps-product--standard">
                                        <div class="ps-product__thumbnail">
                                            <a class="ps-product__image" href="Shop.aspx?id=36">
                                                <figure>
                                                    <img src="../../Images/Customer/products/New Product/13.jpg" alt="alt" /><img src="../../Images/Customer/products/New Product/13.13.jpg" alt="alt" />
                                                </figure>
                                            </a>

                                            <div class="ps-product__badge">
                                                <div class="ps-badge ps-badge--sale">Sale</div>
                                            </div>
                                        </div>
                                        <div class="ps-product__content">
                                            <h5 class="ps-product__title"><a href="Shop.aspx?id=36">Rossmax Digital Thermometer TG100</a></h5>
                                            <div class="ps-product__meta">
                                                <span class="ps-product__price">LKR 1150.00</span>
                                            </div>
                                            <div class="ps-product__rating">
                                                <select class="ps-rating" data-read-only="true">
                                                    <option value="1">1</option>
                                                    <option value="2">2</option>
                                                    <option value="3" selected="selected">3</option>
                                                    <option value="4">4</option>
                                                    <option value="5">5</option>
                                                </select><span class="ps-product__review">( Reviews)</span>
                                            </div>
                                            <div class="ps-product__desc">
                                                <ul class="ps-product__list">
                                                    <li>Study history up to 30 days</li>
                                                    <li>Up to 5 users simultaneously</li>
                                                    <li>Has HEALTH certificate</li>
                                                </ul>
                                            </div>
                                            <div class="ps-product__actions ps-product__group-mobile">
                                                <div class="ps-product__quantity">
                                                    <div class="def-number-input number-input safari_only">
                                                        <button class="minus" onclick="this.parentNode.querySelector('input[type=number]').stepDown()"><i class="icon-minus"></i></button>
                                                        <input class="quantity" min="0" name="quantity" value="1" type="number" />
                                                        <button class="plus" onclick="this.parentNode.querySelector('input[type=number]').stepUp()"><i class="icon-plus"></i></button>
                                                    </div>
                                                </div>

                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="col-6 col-md-4 col-lg-2dot4 p-0">
                                <div class="ps-section__product">
                                    <div class="ps-product ps-product--standard">
                                        <div class="ps-product__thumbnail">
                                            <a class="ps-product__image" href="Shop.aspx?id=35">
                                                <figure>
                                                    <img src="../../Images/Customer/products/New Product/12.jpg" alt="alt" /><img src="../../Images/Customer/products/New Product/12.12.jpg" alt="alt" />
                                                </figure>
                                            </a>

                                            <div class="ps-product__badge">
                                                <div class="ps-badge ps-badge--sale">Sale</div>
                                            </div>
                                        </div>
                                        <div class="ps-product__content">
                                            <h5 class="ps-product__title"><a href="Shop.aspx?id=35">Infrared Thermometer</a></h5>
                                            <div class="ps-product__meta">
                                                <span class="ps-product__price sale">LKR 1990.00</span><span class="ps-product__del">LKR 2150.00</span>
                                            </div>
                                            <div class="ps-product__rating">
                                                <select class="ps-rating" data-read-only="true">
                                                    <option value="1">1</option>
                                                    <option value="2">2</option>
                                                    <option value="3">3</option>
                                                    <option value="4">4</option>
                                                    <option value="5" selected="selected">5</option>
                                                </select><span class="ps-product__review">( Reviews)</span>
                                            </div>
                                            <div class="ps-product__desc">
                                                <ul class="ps-product__list">
                                                    <li>Study history up to 30 days</li>
                                                    <li>Up to 5 users simultaneously</li>
                                                    <li>Has HEALTH certificate</li>
                                                </ul>
                                            </div>
                                            <div class="ps-product__actions ps-product__group-mobile">
                                                <div class="ps-product__quantity">
                                                    <div class="def-number-input number-input safari_only">
                                                        <button class="minus" onclick="this.parentNode.querySelector('input[type=number]').stepDown()"><i class="icon-minus"></i></button>
                                                        <input class="quantity" min="0" name="quantity" value="1" type="number" />
                                                        <button class="plus" onclick="this.parentNode.querySelector('input[type=number]').stepUp()"><i class="icon-plus"></i></button>
                                                    </div>
                                                </div>

                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="col-6 col-md-4 col-lg-2dot4 p-0">
                                <div class="ps-section__product">
                                    <div class="ps-product ps-product--standard">
                                        <div class="ps-product__thumbnail">
                                            <a class="ps-product__image" href="Shop.aspx?id=18">
                                                <figure>
                                                    <img src="../../Images/Customer/products/New Product/14.jpg" alt="alt" /><img src="../../Images/Customer/products/New Product/14.14.jpg" alt="alt" />
                                                </figure>
                                            </a>

                                            <div class="ps-product__badge">
                                                <div class="ps-badge ps-badge--sale">Sale</div>
                                            </div>
                                        </div>
                                        <div class="ps-product__content">
                                            <h5 class="ps-product__title"><a href="Shop.aspx?id=18">Accu-Chek Active Blood Glucose Monitor</a></h5>
                                            <div class="ps-product__meta">
                                                <span class="ps-product__price sale">LKR 5650.00</span><span class="ps-product__del">LKR 5800.00</span>
                                            </div>
                                            <div class="ps-product__rating">
                                                <select class="ps-rating" data-read-only="true">
                                                    <option value="1">1</option>
                                                    <option value="2">2</option>
                                                    <option value="3">3</option>
                                                    <option value="4">4</option>
                                                    <option value="5" selected="selected">5</option>
                                                </select><span class="ps-product__review">( Reviews)</span>
                                            </div>
                                            <div class="ps-product__desc">
                                                <ul class="ps-product__list">
                                                    <li>Study history up to 30 days</li>
                                                    <li>Up to 5 users simultaneously</li>
                                                    <li>Has HEALTH certificate</li>
                                                </ul>
                                            </div>
                                            <div class="ps-product__actions ps-product__group-mobile">
                                                <div class="ps-product__quantity">
                                                    <div class="def-number-input number-input safari_only">
                                                        <button class="minus" onclick="this.parentNode.querySelector('input[type=number]').stepDown()"><i class="icon-minus"></i></button>
                                                        <input class="quantity" min="0" name="quantity" value="1" type="number" />
                                                        <button class="plus" onclick="this.parentNode.querySelector('input[type=number]').stepUp()"><i class="icon-plus"></i></button>
                                                    </div>
                                                </div>

                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="col-6 col-md-4 col-lg-2dot4 p-0">
                                <div class="ps-section__product">
                                    <div class="ps-product ps-product--standard">
                                        <div class="ps-product__thumbnail">
                                            <a class="ps-product__image" href="Shop.aspx?id=46">
                                                <figure>
                                                    <img src="../../Images/Customer/products/New Product/22.jpg" alt="alt" /><img src="../../Images/Customer/products/New Product/22.22.jpg" alt="alt" />
                                                </figure>
                                            </a>

                                            <div class="ps-product__badge">
                                                <div class="ps-badge ps-badge--sale">Sale</div>
                                            </div>
                                        </div>
                                        <div class="ps-product__content">
                                            <h5 class="ps-product__title"><a href="Shop.aspx?id=46">Baby Cheramy Floral Soap 5’S Pack 375g</a></h5>
                                            <div class="ps-product__meta">
                                                <span class="ps-product__price sale">LKR 260.00</span><span class="ps-product__del">LKR 300.00</span>
                                            </div>
                                            <div class="ps-product__rating">
                                                <select class="ps-rating" data-read-only="true">
                                                    <option value="1">1</option>
                                                    <option value="2">2</option>
                                                    <option value="3">3</option>
                                                    <option value="4">4</option>
                                                    <option value="5" selected="selected">5</option>
                                                </select><span class="ps-product__review">( Reviews)</span>
                                            </div>
                                            <div class="ps-product__desc">
                                                <ul class="ps-product__list">
                                                    <li>Study history up to 30 days</li>
                                                    <li>Up to 5 users simultaneously</li>
                                                    <li>Has HEALTH certificate</li>
                                                </ul>
                                            </div>
                                            <div class="ps-product__actions ps-product__group-mobile">
                                                <div class="ps-product__quantity">
                                                    <div class="def-number-input number-input safari_only">
                                                        <button class="minus" onclick="this.parentNode.querySelector('input[type=number]').stepDown()"><i class="icon-minus"></i></button>
                                                        <input class="quantity" min="0" name="quantity" value="1" type="number" />
                                                        <button class="plus" onclick="this.parentNode.querySelector('input[type=number]').stepUp()"><i class="icon-plus"></i></button>
                                                    </div>
                                                </div>

                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="col-6 col-md-4 col-lg-2dot4 p-0">
                                <div class="ps-section__product">
                                    <div class="ps-product ps-product--standard">
                                        <div class="ps-product__thumbnail">
                                            <a class="ps-product__image" href="Shop.aspx?id=47">
                                                <figure>
                                                    <img src="../../Images/Customer/products/New Product/27.jpg" alt="alt" /><img src="../../Images/Customer/products/New Product/27.27.jpg" alt="alt" />
                                                </figure>
                                            </a>

                                            <div class="ps-product__badge">
                                                <div class="ps-badge ps-badge--sale">Sale</div>
                                            </div>
                                        </div>
                                        <div class="ps-product__content">
                                            <h5 class="ps-product__title"><a href="Shop.aspx?id=47">Tummy Tea 40g Pack - 20 Tea Bags</a></h5>
                                            <div class="ps-product__meta">
                                                <span class="ps-product__price sale">LKR 640.00</span><span class="ps-product__del">LKR 700.00</span>
                                            </div>
                                            <div class="ps-product__rating">
                                                <select class="ps-rating" data-read-only="true">
                                                    <option value="1">1</option>
                                                    <option value="2">2</option>
                                                    <option value="3">3</option>
                                                    <option value="4">4</option>
                                                    <option value="5" selected="selected">5</option>
                                                </select><span class="ps-product__review">( Reviews)</span>
                                            </div>
                                            <div class="ps-product__desc">
                                                <ul class="ps-product__list">
                                                    <li>Study history up to 30 days</li>
                                                    <li>Up to 5 users simultaneously</li>
                                                    <li>Has HEALTH certificate</li>
                                                </ul>
                                            </div>
                                            <div class="ps-product__actions ps-product__group-mobile">
                                                <div class="ps-product__quantity">
                                                    <div class="def-number-input number-input safari_only">
                                                        <button class="minus" onclick="this.parentNode.querySelector('input[type=number]').stepDown()"><i class="icon-minus"></i></button>
                                                        <input class="quantity" min="0" name="quantity" value="1" type="number" />
                                                        <button class="plus" onclick="this.parentNode.querySelector('input[type=number]').stepUp()"><i class="icon-plus"></i></button>
                                                    </div>
                                                </div>

                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="col-6 col-md-4 col-lg-2dot4 p-0">
                                <div class="ps-section__product">
                                    <div class="ps-product ps-product--standard">
                                        <div class="ps-product__thumbnail">
                                            <a class="ps-product__image" href="Shop.aspx?id=48">
                                                <figure>
                                                    <img src="../../Images/Customer/products/New Product/23.jpg" alt="alt" /><img src="../../Images/Customer/products/New Product/23.23.jpg" alt="alt" />
                                                </figure>
                                            </a>

                                            <div class="ps-product__badge">
                                                <div class="ps-badge ps-badge--sale">Sale</div>
                                            </div>
                                        </div>
                                        <div class="ps-product__content">
                                            <h5 class="ps-product__title"><a href="Shop.aspx?id=48">Lacto Calamine Lotion 100ml</a></h5>
                                            <div class="ps-product__meta">
                                                <span class="ps-product__price sale">LKR 380.00</span><span class="ps-product__del">LKR 400.00</span>
                                            </div>
                                            <div class="ps-product__rating">
                                                <select class="ps-rating" data-read-only="true">
                                                    <option value="1">1</option>
                                                    <option value="2">2</option>
                                                    <option value="3">3</option>
                                                    <option value="4">4</option>
                                                    <option value="5" selected="selected">5</option>
                                                </select><span class="ps-product__review">( Reviews)</span>
                                            </div>
                                            <div class="ps-product__desc">
                                                <ul class="ps-product__list">
                                                    <li>Study history up to 30 days</li>
                                                    <li>Up to 5 users simultaneously</li>
                                                    <li>Has HEALTH certificate</li>
                                                </ul>
                                            </div>
                                            <div class="ps-product__actions ps-product__group-mobile">
                                                <div class="ps-product__quantity">
                                                    <div class="def-number-input number-input safari_only">
                                                        <button class="minus" onclick="this.parentNode.querySelector('input[type=number]').stepDown()"><i class="icon-minus"></i></button>
                                                        <input class="quantity" min="0" name="quantity" value="1" type="number" />
                                                        <button class="plus" onclick="this.parentNode.querySelector('input[type=number]').stepUp()"><i class="icon-plus"></i></button>
                                                    </div>
                                                </div>

                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="col-6 col-md-4 col-lg-2dot4 p-0">
                                <div class="ps-section__product">
                                    <div class="ps-product ps-product--standard">
                                        <div class="ps-product__thumbnail">
                                            <a class="ps-product__image" href="Shop.aspx?id=49">
                                                <figure>
                                                    <img src="../../Images/Customer/products/New Product/25.jpg" alt="alt" /><img src="../../Images/Customer/products/New Product/25.25.jpg" alt="alt" />
                                                </figure>
                                            </a>

                                            <div class="ps-product__badge">
                                            </div>
                                        </div>
                                        <div class="ps-product__content">
                                            <h5 class="ps-product__title"><a href="Shop.aspx?id=49">Strepsils Original Lozenges 24 Pack</a></h5>
                                            <div class="ps-product__meta">
                                                <span class="ps-product__price">LKR 250.00</span>
                                            </div>
                                            <div class="ps-product__rating">
                                                <select class="ps-rating" data-read-only="true">
                                                    <option value="1">1</option>
                                                    <option value="2">2</option>
                                                    <option value="3">3</option>
                                                    <option value="4">4</option>
                                                    <option value="5" selected="selected">5</option>
                                                </select><span class="ps-product__review">( Reviews)</span>
                                            </div>
                                            <div class="ps-product__desc">
                                                <ul class="ps-product__list">
                                                    <li>Study history up to 30 days</li>
                                                    <li>Up to 5 users simultaneously</li>
                                                    <li>Has HEALTH certificate</li>
                                                </ul>
                                            </div>
                                            <div class="ps-product__actions ps-product__group-mobile">
                                                <div class="ps-product__quantity">
                                                    <div class="def-number-input number-input safari_only">
                                                        <button class="minus" onclick="this.parentNode.querySelector('input[type=number]').stepDown()"><i class="icon-minus"></i></button>
                                                        <input class="quantity" min="0" name="quantity" value="1" type="number" />
                                                        <button class="plus" onclick="this.parentNode.querySelector('input[type=number]').stepUp()"><i class="icon-plus"></i></button>
                                                    </div>
                                                </div>

                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="col-6 col-md-4 col-lg-2dot4 p-0">
                                <div class="ps-section__product">
                                    <div class="ps-product ps-product--standard">
                                        <div class="ps-product__thumbnail">
                                            <a class="ps-product__image" href="Shop.aspx?id=50">
                                                <figure>
                                                    <img src="../../Images/Customer/products/New Product/26.jpg" alt="alt" /><img src="../../Images/Customer/products/New Product/26.26.jpg" alt="alt" />
                                                </figure>
                                            </a>

                                            <div class="ps-product__badge">
                                                <div class="ps-badge ps-badge--sale">Sale</div>
                                            </div>
                                        </div>
                                        <div class="ps-product__content">
                                            <h5 class="ps-product__title"><a href="Shop.aspx?id=50">Baraka Garlichol - Vitamins</a></h5>
                                            <div class="ps-product__meta">
                                                <span class="ps-product__price">LKR 490.00</span>
                                            </div>
                                            <div class="ps-product__rating">
                                                <select class="ps-rating" data-read-only="true">
                                                    <option value="1">1</option>
                                                    <option value="2">2</option>
                                                    <option value="3">3</option>
                                                    <option value="4" selected="selected">4</option>
                                                    <option value="5">5</option>
                                                </select><span class="ps-product__review">( Reviews)</span>
                                            </div>
                                            <div class="ps-product__desc">
                                                <ul class="ps-product__list">
                                                    <li>Study history up to 30 days</li>
                                                    <li>Up to 5 users simultaneously</li>
                                                    <li>Has HEALTH certificate</li>
                                                </ul>
                                            </div>
                                            <div class="ps-product__actions ps-product__group-mobile">
                                                <div class="ps-product__quantity">
                                                    <div class="def-number-input number-input safari_only">
                                                        <button class="minus" onclick="this.parentNode.querySelector('input[type=number]').stepDown()"><i class="icon-minus"></i></button>
                                                        <input class="quantity" min="0" name="quantity" value="1" type="number" />
                                                        <button class="plus" onclick="this.parentNode.querySelector('input[type=number]').stepUp()"><i class="icon-plus"></i></button>
                                                    </div>
                                                </div>

                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>

                    </div>
                </section>
            </div>
            <section class="ps-section--reviews" data-background="img/roundbg.png">
                <h3 class="ps-section__title">
                    <img src="../../Images/Customer/quote-icon.png">Latest reviews</h3>
                <div class="ps-section__content">
                    <div class="owl-carousel" data-owl-auto="false" data-owl-loop="true" data-owl-speed="13000" data-owl-gap="0" data-owl-nav="true" data-owl-dots="true" data-owl-item="5" data-owl-item-xs="1" data-owl-item-sm="1" data-owl-item-md="3" data-owl-item-lg="5" data-owl-item-xl="5" data-owl-duration="1000" data-owl-mousedrag="on">
                        <div class="ps-review">
                            <div class="ps-review__text">There was a small mistake in the order. In return, I got the correct order and I could keep the wrong one for myself.</div>
                            <div class="ps-review__name">Kapila Kumara</div>
                            <div class="ps-review__review">
                                <select class="ps-rating" data-read-only="true">
                                    <option value="1">1</option>
                                    <option value="2">2</option>
                                    <option value="3">3</option>
                                    <option value="4" selected="selected">4</option>
                                    <option value="5">5</option>
                                </select>
                            </div>
                        </div>
                        <div class="ps-review">
                            <div class="ps-review__text">I ordered on Friday evening and on Monday at 12:30 the package was with me. I have never encountered such a fast order processing.</div>
                            <div class="ps-review__name">Kumari Perera</div>
                            <div class="ps-review__review">
                                <select class="ps-rating" data-read-only="true">
                                    <option value="1">1</option>
                                    <option value="2">2</option>
                                    <option value="3">3</option>
                                    <option value="4" selected="selected">4</option>
                                    <option value="5">5</option>
                                </select>
                            </div>
                        </div>
                        <div class="ps-review">
                            <div class="ps-review__text">I ordered on Friday evening and on Monday at 12:30 the package was with me. I have never encountered such a fast order processing.</div>
                            <div class="ps-review__name">Nimal Jayarathne</div>
                            <div class="ps-review__review">
                                <select class="ps-rating" data-read-only="true">
                                    <option value="1">1</option>
                                    <option value="2">2</option>
                                    <option value="3">3</option>
                                    <option value="4" selected="selected">4</option>
                                    <option value="5">5</option>
                                </select>
                            </div>
                        </div>
                        <div class="ps-review">
                            <div class="ps-review__text">Everything is perfect. I would recommend!</div>
                            <div class="ps-review__name">Duleesha Subodhini</div>
                            <div class="ps-review__review">
                                <select class="ps-rating" data-read-only="true">
                                    <option value="1">1</option>
                                    <option value="2">2</option>
                                    <option value="3">3</option>
                                    <option value="4" selected="selected">4</option>
                                    <option value="5">5</option>
                                </select>
                            </div>
                        </div>
                        <div class="ps-review">
                            <div class="ps-review__text">There was a small mistake in the order. In return, I got the correct order and I could keep the wrong one for myself.</div>
                            <div class="ps-review__name">Deshan Edirisooriya</div>
                            <div class="ps-review__review">
                                <select class="ps-rating" data-read-only="true">
                                    <option value="1">1</option>
                                    <option value="2">2</option>
                                    <option value="3">3</option>
                                    <option value="4" selected="selected">4</option>
                                    <option value="5">5</option>
                                </select>
                            </div>
                        </div>
                        <div class="ps-review">
                            <div class="ps-review__text">Everything is perfect. I would recommend!</div>
                            <div class="ps-review__name">Krishan Tharuka</div>
                            <div class="ps-review__review">
                                <select class="ps-rating" data-read-only="true">
                                    <option value="1">1</option>
                                    <option value="2">2</option>
                                    <option value="3">3</option>
                                    <option value="4" selected="selected">4</option>
                                    <option value="5">5</option>
                                </select>
                            </div>
                        </div>
                        <div class="ps-review">
                            <div class="ps-review__text">I ordered on Friday evening and on Monday at 12:30 the package was with me. I have never encountered such a fast order processing.</div>
                            <div class="ps-review__name">Amali Pathirana</div>
                            <div class="ps-review__review">
                                <select class="ps-rating" data-read-only="true">
                                    <option value="1">1</option>
                                    <option value="2">2</option>
                                    <option value="3">3</option>
                                    <option value="4" selected="selected">4</option>
                                    <option value="5">5</option>
                                </select>
                            </div>
                        </div>
                    </div>
                </div>
            </section>
            <div class="container">
                <section class="ps-section--instagram">
                    <h3 class="ps-section__title">Follow <strong>@Healers Pharmacy </strong>on instagram</h3>
                    <div class="ps-section__content">
                        <div class="row m-0">
                            <div class="col-6 col-md-4 col-lg-2">
                                <a class="ps-image--transition" href="https://www.instagram.com/p/CTHSp_tB6KE/">
                                    <img src="../../Images/Customer/Pharmacy/image02.jpg" style="height: 200px"><span class="ps-image__overlay"><i class="fa fa-instagram"></i></span></a>
                            </div>
                            <div class="col-6 col-md-4 col-lg-2">
                                <a class="ps-image--transition" href="https://www.instagram.com/p/CTHUcTpB7LO/">
                                    <img src="../../Images/Customer/Pharmacy/image06.jpg" style="height: 200px"><span class="ps-image__overlay"><i class="fa fa-instagram"></i></span></a>
                            </div>
                            <div class="col-6 col-md-4 col-lg-2">
                                <a class="ps-image--transition" href="https://www.instagram.com/p/CTHUZGeBPJM/">
                                    <img src="../../Images/Customer/Pharmacy/image05.jpg" style="height: 200px"><span class="ps-image__overlay"><i class="fa fa-instagram"></i></span></a>
                            </div>
                            <div class="col-6 col-md-4 col-lg-2">
                                <a class="ps-image--transition" href="https://www.instagram.com/p/CTHUuubhs87/">
                                    <img src="../../Images/Customer/Pharmacy/image09.jpg" style="height: 200px"><span class="ps-image__overlay"><i class="fa fa-instagram"></i></span></a>
                            </div>
                            <div class="col-6 col-md-4 col-lg-2">
                                <a class="ps-image--transition" href="https://www.instagram.com/p/CTHU2LahYCr/">
                                    <img src="../../Images/Customer/Pharmacy/image11.jpg" style="height: 200px"><span class="ps-image__overlay"><i class="fa fa-instagram"></i></span></a>
                            </div>
                            <div class="col-6 col-md-4 col-lg-2">
                                <a class="ps-image--transition" href="https://www.instagram.com/p/CTHWj_sBvrB/">
                                    <img src="../../Images/Customer/Pharmacy/image13.jpg" style="height: 200px"><span class="ps-image__overlay"><i class="fa fa-instagram"></i></span></a>
                            </div>
                        </div>
                    </div>
                </section>
                <section class="ps-section--newsletter" data-background="img/newsletter-bg.jpg">
                    <h3 class="ps-section__title">Join our newsletter and get
                        <br>
                        LKR 500 discount for your first order</h3>

                </section>
            </div>
        </div>
    </div>

</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="cphScripts" runat="server">
</asp:Content>
